//
//  EditProfileContract.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IEditProfileView {
    func renderEditProfileView ()
}
protocol IEditProfilePresenter {
    func EditUser(user:User)
    func onSuccess()
    func onFail(message: String)
}
protocol IEditProfileModel {
    func getUser(user:User)
}
