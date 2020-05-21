//
//  EditProfileModel.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class EditProfileModel:IEditProfileModel{
      var ref: DatabaseReference!
    var editProfilePresenterRef:IEditProfilePresenter!
       init(editProfilePresenterRef:IEditProfilePresenter) {
           
           self.editProfilePresenterRef=editProfilePresenterRef
            ref = Database.database().reference()
       }
    
    func editUser(user: User,img:UIImage?) {
        
        var userObj=User()
        userObj.id=user.id
        userObj.email=user.email
        userObj.name=user.name
        userObj.birthdate=user.birthdate
        userObj.gender=user.gender
        userObj.address=user.address
        userObj.phone=user.phone
        userObj.insurance=user.insurance
        
        
        
        
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
                               
                     
                            userObj.imagePath = url?.absoluteString
                            
                let userDic = try! DictionaryEncoder.encode(userObj)
                            self.ref.child("Users").child(userObj.id!).setValue(userDic)
                      
                            self.editProfilePresenterRef.onSuccess()
                            
                            

                                           })
                           
                       }
                       
                    })
                    
                    
                    
        
        
        
        
        
        
        
        
        
  
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
