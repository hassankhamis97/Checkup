//
//  EditProfilePresenter.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase

class EditProfilePresenter :IEditProfilePresenter{
    
    var editProfileView:IEditProfileView
       
       init(editProfileView:IEditProfileView) {
           self.editProfileView=editProfileView
       }
    
    func editUser(user: User,img:UIImage?) {
        
        editProfileView.showIndicator()
        let editProfileModelRef = EditProfileModel(editProfilePresenterRef: self)
        editProfileModelRef.editUser(user: user,img: img)
        
    
    }
    
    func onSuccess() {
        editProfileView.updatedUser()
        editProfileView.hideIndicator()
    }
    
    func onFail(message: String) {
        editProfileView.errorMessage(msg: message)
         editProfileView.hideIndicator()
    }
    
    
    
    
    
    
    
    

}
