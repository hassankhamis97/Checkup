//
//  ImageModel.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage


class ImageModel: IImageModel {
    
    var imagePresenterRef:IImagePresenter!
    
    
    init(imagePresenterRef:IImagePresenter) {
        self.imagePresenterRef=imagePresenterRef
    }
    
    
    
    
    func saveImage(img: UIImage?) {
        
        
        guard let imageSelected = img else {
                 
                 return
             }
             
             guard let imageData=imageSelected.jpegData(compressionQuality: 0.4) else{
                 return
             }
             
             
             let storageRef=Storage.storage().reference(forURL: "gs://checkup-23ffe.appspot.com")
             let storageProfileRef=storageRef.child("profile").child(Auth.auth().currentUser!.uid)
             
             let metaData=StorageMetadata()
             metaData.contentType="image/jpg"
             
             
             
             storageProfileRef.putData(imageData, metadata: metaData,completion:  { (storageMetaData, error) in
                 if error != nil{
                     print(error?.localizedDescription)
                     return
                 }
                 else{
                    
                    storageProfileRef.downloadURL(completion: { (url: URL?, error: Error?) in
                                        print(url?.absoluteString)
                        
                        
                        self.imagePresenterRef.onSuccess(url: url!.absoluteString)

                                    })
                    
                }
                
             })
             
             
             
        
        
    
    }
    
    
}
