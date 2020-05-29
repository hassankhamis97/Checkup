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
import RealmSwift


class EditProfileModel:IEditProfileModel{
    var ref: DatabaseReference!
    let db : Firestore?
    
    var editProfilePresenterRef:IEditProfilePresenter!
    init(editProfilePresenterRef:IEditProfilePresenter) {
        
        self.editProfilePresenterRef=editProfilePresenterRef
        ref = Database.database().reference()
        db = Firestore.firestore()
    }
    
    func editUser(user: User,img:UIImage?) {
        
        var userObj=User()
        var userChat=UserChat()
        userObj.id=user.id
        userObj.email=user.email
        userObj.name=user.name
        userObj.birthdate=user.birthdate
        userObj.gender=user.gender
        userObj.address=user.address
        userObj.phone=user.phone
        userObj.insurance=user.insurance
        userChat.id=user.id
        userChat.nickname=user.name
        
        
        
        
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
                    userChat.photoUrl=url?.absoluteString
                    
                    let userDic = try! DictionaryEncoder.encode(userObj)
                    let userChatDic = try! DictionaryEncoder.encode(userChat)
                    self.ref.child("Users").child(userObj.id!).setValue(userDic)
                    
                    
                    self.updateNameRealm(userName:userObj.name!,id:userObj.id!)
                    
                    let dbRef = self.db?.collection("users").document(userObj.id!).setData(userChatDic) { err in
                        if let err = err {
                            self.editProfilePresenterRef.onFail(message: err.localizedDescription)
                        } else {
                            self.editProfilePresenterRef.onSuccess()
                        }
                    }
       
                })
                
            }
            
        })
        
    
    }
    
    

    func updateNameRealm(userName:String,id:String)
            {
                
                
             let realm = try! Realm()
              let userNameRealm = realm.objects(Person.self).filter("id = %@",id)
              if let userRealm = userNameRealm.first {
                  try! realm.write {
                    userRealm.name=userName
                      
                
            }

        }
   
    }

}
