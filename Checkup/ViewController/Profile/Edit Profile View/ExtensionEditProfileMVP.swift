//
//  ExtensionEditProfileMVP.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension EditProfileTableViewController:IEditProfileView, IImageView, IProfileView{
    func renderProfileView(user: User) {
        self.user=user
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
         saveBtnOutlet.alpha = 0
        activityIndicator.alpha=1
        activityIndicator.show()
                
    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.hide()
    }
    
    func errorMessage(msg: String) {
        print("")
    }
    
    
    
    
    
    
    
    
    
    
    
}
