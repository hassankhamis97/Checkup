//
//  NewRequestModel.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import Alamofire
class NewRequestModel: INewRequestModel {
    var newRequestPresenterRef : INewRequestPresenter
    var ref: DatabaseReference!
    let db : Firestore?
    init(newRequestPresenterRef : INewRequestPresenter) {
        self.newRequestPresenterRef = newRequestPresenterRef
        ref = Database.database().reference()
        db = Firestore.firestore()
    }
    func saveRequest(testObj: Test, roushettaImages: [UIImage]) {
        var roushettaImagesCompressed = [Data]()
        var imgPathsArr = [String]()
        var count = 0
        var id = ref.childByAutoId()
        DispatchQueue.background(background: {
            // do something in background
            for i in 0..<roushettaImages.count {
            //            let imgData1 = NSData(data: roushettaImages[i].jpegData(compressionQuality: 1)!)
            //            var imageSize: Int = imgData1.count
            //            print("actual size of image in KB: %f ", Double(imageSize) / 1000.0)
            //            print(roushettaImages[i].count)
                        if let imageData = roushettaImages[i].jpeg(.low) {
                            print(imageData.count)
                            print("actual size of image in KB: %f ", Double(imageData.count) / 1000.0)
                            roushettaImagesCompressed.append(imageData)
                        }
            //            roushettaImagesCompressed.append(roushettaImages[i].compressTo(1)!)
                    }
        }, completion:{
            // when background job finished, do something in main thread
        
        
//        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

        
//        roushettaImages.compressTo(1)
        if(roushettaImagesCompressed.count > 0){
            for i in 0..<roushettaImagesCompressed.count{
                let storageRef = Storage.storage().reference().child("roushetta/\(String(describing: testObj.userId!))/\(id.key!)/test\(i).jpg")
                // Create the file metadata
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpeg"
                let uploadTask = storageRef.putData(roushettaImagesCompressed[i], metadata: metadata) { (metadata, error) in
                    guard let metadata = metadata else {
                        // Uh-oh, an error occurred!
                        self.newRequestPresenterRef.onFail(message: error!.localizedDescription)
                        return
                    }
                    // Metadata contains file metadata such as size, content-type.
                    let size = metadata.size
                    // You can also access to download URL after upload.
                    storageRef.downloadURL { (url, error) in
                        guard let downloadURL = url else {
                            self.newRequestPresenterRef.onFail(message: error!.localizedDescription)
                            // Uh-oh, an error occurred!
                            return
                        }
                        imgPathsArr.append(downloadURL.absoluteString)
                        print(url)
                        count += 1
                        if(count == roushettaImagesCompressed.count){
                            //                    testObj.roushettaPaths = imgPathsArr
                            self.saveCompleteObj(testObj: testObj, imgPathsArr: imgPathsArr)
                            self.newRequestPresenterRef.onSuccess()
                        }
                    }
                }
            }

        }
        else{
            self.saveCompleteObj(testObj: testObj, imgPathsArr: nil)
        }
            })
    }
    func saveCompleteObj(testObj: Test, imgPathsArr: [String]?) {
        var testFinObj = testObj
        
        if imgPathsArr != nil {
            testFinObj.roushettaPaths = imgPathsArr
        }
        //        testFinObj.id = id
        
        //        ref.child("Tests").child(testFinObj.labId!).child(testFinObj.branchId!).setValue(testFinDic)
        ref.child("GeneratedCode").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            var code = value?["code"] as? Int ?? 0
            code += 1
            self.ref.child("GeneratedCode").setValue(["code": code])
            
            testFinObj.generatedCode = String(code)
            let testFinDic = try! DictionaryEncoder.encode(testFinObj)
            let urlString = "http://www.checkup.somee.com/api/AnalysisService/AddNewAnalysis"
            //            let urlString = "http://192.168.1.9:3000/api/AnalysisService/AddNewAnalysis"
            Alamofire.request(urlString, method: .post, parameters: testFinDic,encoding: JSONEncoding.default, headers: nil).responseString {
                response in
                switch response.result {
                case .success:
                    print(response)
                    self.newRequestPresenterRef.onSuccess()
                    Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/GetIsFirstDealWithBranch?userId=\(Auth.auth().currentUser!.uid)&branchId=\(testFinObj.branchId!)").validate().responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            if value as! Int == 0 {
                                self.charInitializeInFireStore(firstId: Auth.auth().currentUser!.uid, secondId: testFinObj.branchId!)
                                self.charInitializeInFireStore(firstId: testFinObj.branchId!, secondId: Auth.auth().currentUser!.uid)
                            }
                            debugPrint(response)
                            
                            break
                        case .failure(let error):
                            //                        self.newRequestPresenterRef.onFail(message: error.localizedDescription)
                            print(error)
                            break
                        }
                    }
                    
                    break
                case .failure(let error):
                    self.newRequestPresenterRef.onFail(message: error.localizedDescription)
                    
                    print(error)
                }
            }
            //            self.ref.child("TestsHassan").child(testFinObj.branchId!).child(testFinObj.id!).setValue(testFinDic)
            // ...
        }) { (error) in
            self.newRequestPresenterRef.onFail(message: error.localizedDescription)
            print(error.localizedDescription)
        }
    }
    func charInitializeInFireStore(firstId: String , secondId: String) {
        var chatStatus = ChatStatus(lastMsgTimeStamp: "", noOfUnReadMessage: 0, lastMessage: "let's start chat", senderId: secondId)
        let chatStatusDic = try! DictionaryEncoder.encode(chatStatus)
        if Auth.auth().currentUser!.uid == firstId {
            self.db?.collection("userChat").document(firstId).setData(["currentViewedPerson": ""]){ err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
        self.db?.collection("userChat").document(firstId).collection(firstId).document(secondId).setData(chatStatusDic){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    //    func hashString(str: String) -> Int {
    //        var hash : Int = 0
    //        for i in 0..<str.count {
    ////            var yy = Character("a").asciiValue
    ////            var x = Character(str[i]).asciiValue
    //            var x = Character(str[i]).asciiValue * 31 as! Double
    //            var y = str.count - i as! Double
    //            hash += Int(pow(x,y))
    ////            pow(Decimal(Character(str[i]).asciiValue * 31), 5)
    //            hash = hash & hash
    //        }
    //        return hash
    //    }
    //    hashString = str => {
    //        let hash = 0
    //        for (let i = 0; i < str.length; i++) {
    //            hash += Math.pow(str.characterAtIndex(i) * 31, str.length - i)
    //            hash = hash & hash // Convert to 32bit integer
    //        }
    //        return hash
    //    }
    func compressImage(imageData : Data) -> UIImage {
//        let imageData = image.jpegData(compressionQuality: 0.2)
        let image = UIImage(data: imageData)
    return image!
    }
}



//
//extension String {
//
//    var length: Int {
//        return count
//    }
//
//    subscript (i: Int) -> String {
//        return self[i ..< i + 1]
//    }
//
//    func substring(fromIndex: Int) -> String {
//        return self[min(fromIndex, length) ..< length]
//    }
//
//    func substring(toIndex: Int) -> String {
//        return self[0 ..< max(0, toIndex)]
//    }
//
//    subscript (r: Range<Int>) -> String {
//        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
//                                            upper: min(length, max(0, r.upperBound))))
//        let start = index(startIndex, offsetBy: range.lowerBound)
//        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
//        return String(self[start ..< end])
//    }
//}
//extension Character {
//    var asciiValue: Int {
//        get {
//            let s = String(self).unicodeScalars
//            return Int(s[s.startIndex].value)
//        }
//    }
//}
extension UIImage {
    // MARK: - UIImage+Resize
//    func compressTo(_ expectedSizeInMb:Int) -> UIImage? {
//        let sizeInBytes = expectedSizeInMb * 1024 * 1024
//        var needCompress:Bool = true
//        var imgData:Data?
//        var compressingValue:CGFloat = 1.0
//        while (needCompress && compressingValue > 0.0) {
//            if let data:Data = self.jpegData(compressionQuality: compressingValue) {
//                if data.count < sizeInBytes {
//                    needCompress = false
//                    imgData = data
//                } else {
//                    compressingValue -= 0.1
//                }
//            }
//        }
//
//        if let data = imgData {
//            if (data.count < sizeInBytes) {
//                return UIImage(data: data)
//            }
//        }
//        return nil
//    }
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
    
}
