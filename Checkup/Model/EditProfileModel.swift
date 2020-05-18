//
//  EditProfileModel.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase

class EditProfileModel:IEditProfileModel{
      var ref: DatabaseReference!
    var editProfilePresenterRef:IEditProfilePresenter!
       init(editProfilePresenterRef:IEditProfilePresenter) {
           
           self.editProfilePresenterRef=editProfilePresenterRef
            ref = Database.database().reference()
       }
    
    func editUser(user: User) {
        
    let userObj=user
    let userDic = try! DictionaryEncoder.encode(userObj)
    ref.child("Users").child(userObj.id!).setValue(userDic)
        
        editProfilePresenterRef.onSuccess()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
