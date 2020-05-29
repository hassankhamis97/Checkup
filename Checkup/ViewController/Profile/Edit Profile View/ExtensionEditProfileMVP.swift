//
//  ExtensionEditProfileMVP.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension EditProfileTableViewController:IEditProfileView, IImageView, IProfileView,IView{
    func showBtnIndicator() {
          saveBtnOutlet.alpha = 0
           activityIndicator.alpha=1
           activityIndicator.show()
    }
    
    func renderProfileView(user: User) {
        self.user=user
        self.addressObj=user.address
        reloadData()
    }
    
    func renderImage(url: String) {
        self.imageUrl=url
    }
    
    func updatedUser() {
        navigationController?.popViewController(animated: true)
    }
    
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
       
    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.hide()
        activityIndicator.alpha=0
    }
    
    func errorMessage(msg: String) {
           Alert.showSimpleAlert(title: "sorry",message: msg, viewRef: self)
    }
    
    
    
    
    
    
    
    
    
    
    
}
