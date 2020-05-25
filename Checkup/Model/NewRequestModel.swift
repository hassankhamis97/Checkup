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
        var imgPathsArr = [String]()
        var count = 0
        var id = ref.childByAutoId()
        
        if(roushettaImages.count > 0){
            for i in 0..<roushettaImages.count{
                let storageRef = Storage.storage().reference().child("roushetta/\(String(describing: testObj.userId!))/\(id.key!)/test\(i).jpg")
                // Create the file metadata
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpeg"
                let uploadTask = storageRef.putData(roushettaImages[i].pngData()!, metadata: metadata) { (metadata, error) in
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
                        if(count == roushettaImages.count){
                            //                    testObj.roushettaPaths = imgPathsArr
                            self.saveCompleteObj(testObj: testObj, imgPathsArr: imgPathsArr)
                            self.newRequestPresenterRef.onSuccess()
                        }
                    }
                }
            }
            
        }
        else{
            saveCompleteObj(testObj: testObj, imgPathsArr: nil)
        }
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
            Alamofire.request(urlString, method: .post, parameters: testFinDic,encoding: JSONEncoding.default, headers: nil).responseString {
                response in
                switch response.result {
                case .success:
                    print(response)
                    self.newRequestPresenterRef.onSuccess()
                    
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
}
