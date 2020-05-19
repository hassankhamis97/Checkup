//
//  ExtensionEditProfileMVP.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
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
        print("")
    }
    
    func hideIndicator() {
         print("")
    }
    
    func errorMessage(msg: String) {
         print("")
    }
    
    
    
    
    
    
    
    
    
    
    
}
