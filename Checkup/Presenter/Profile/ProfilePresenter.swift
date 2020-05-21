//
//  ProfilePresenter.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation


class ProfilePresenter:IProfilePresenter{
  
    var profileView:IProfileView
    
    init(profileView:IProfileView) {
        self.profileView=profileView
    }
    
    func getUser(userId: String)  {
        let profileModel=ProfileModel(profilePresenterRef: self)
        profileModel.getUser(userId: userId)
    }
    
    func onSuccess(user:User) {
        profileView.hideIndicator()
        profileView.renderProfileView(user: user)
        
    }
    
    func onFail(message: String) {
        profileView.hideIndicator()
        profileView.errorMessage(msg: message)
    }
    
    
    
   
    
    
    
    
    
    
    
}
