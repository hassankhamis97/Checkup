//
//  EditProfileContract.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
protocol IEditProfileView :IBase {
    func updatedUser ()
    func showBtnIndicator()
}
protocol IEditProfilePresenter {
    func editUser(user:User,img:UIImage?)
    func onSuccess()
    func onFail(message: String)
}
protocol IEditProfileModel {
    func editUser(user:User,img:UIImage?)
}
