//
//  EditProfilePresenter.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase

class EditProfilePresenter :IEditProfilePresenter,ICheckConnection{
    
    var user:User!
    var img:UIImage!
    func onSucessfullyConnected() {
        editProfileView.showIndicator()
        editProfileView.showBtnIndicator()
        let editProfileModelRef = EditProfileModel(editProfilePresenterRef: self)
        editProfileModelRef.editUser(user: user,img: img)
        
    }
    
    func onFailConnected() {
        print("There's no internet connection.")
        self.editProfileView.errorMessage(msg: "No internet connection")
    }
    
    
    var editProfileView:IEditProfileView
    
    init(editProfileView:IEditProfileView) {
        self.editProfileView=editProfileView
    }
    
    func editUser(user: User,img:UIImage?) {
        
        self.user=user
        self.img=img
        
        var check = InternetConnection.checkInternetConnection(iCheckConnection: self)
        
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
