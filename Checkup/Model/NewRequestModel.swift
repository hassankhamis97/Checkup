//
//  NewRequestModel.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
class NewRequestModel: INewRequestModel {
    var newRequestPresenterRef : INewRequestPresenter
    var ref: DatabaseReference!
    init(newRequestPresenterRef : INewRequestPresenter) {
        self.newRequestPresenterRef = newRequestPresenterRef
        ref = Database.database().reference()
    }
    func saveRequest(testObj: Test, roushettaImages: [UIImage]) {
        var imgPathsArr = [String]()
        var count = 0
        for i in 0..<roushettaImages.count{
            let storageRef = Storage.storage().reference().child("roushetta/\(String(describing: testObj.userId!))/test\(i).jpg")
            // Create the file metadata
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
//            if let uploadData = roushettaImages[i].pngData() {
//         storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
//             if error != nil {
//                 print("error")
//                 completion(nil)
//             } else {
//                 completion(metadata?.downloadURL()?.absoluteString)!
//                 // your uploaded photo url.
//             }
//        }
//        }
            let uploadTask = storageRef.putData(roushettaImages[i].pngData()!, metadata: metadata) { (metadata, error) in
              guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
              }
              // Metadata contains file metadata such as size, content-type.
              let size = metadata.size
              // You can also access to download URL after upload.
              storageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    
                  // Uh-oh, an error occurred!
                  return
                }
                imgPathsArr.append(downloadURL.absoluteString)
                print(url)
                count += 1
                if(count == roushettaImages.count){
//                    testObj.roushettaPaths = imgPathsArr
                    self.saveCompleteObj(testObj: testObj, imgPathsArr: imgPathsArr)
                }
              }
            }
    }
}
    func saveCompleteObj(testObj: Test, imgPathsArr: [String]) {
        var testFinObj = testObj
        var id = ref.childByAutoId()
        testFinObj.roushettaPaths = imgPathsArr
        testFinObj.id = id.key
        let testFinDic = try! DictionaryEncoder.encode(testFinObj)
//        ref.child("Tests").child(testFinObj.labId!).child(testFinObj.branchId!).setValue(testFinDic)
        ref.child("Tests").child("0G9djW7SzMXGTiXKdGkiYuiTY3g1").child(testFinObj.id!).setValue(testFinDic)
    }
}
