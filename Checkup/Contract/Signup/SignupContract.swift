//
//  SignupContract.swift
//  Checkup
//
//  Created by azab on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

protocol ISignupView : IBase {
    func enterToApp()
}
protocol ISignupPresenter {
    func saveAuthDate(username: String, email: String,password: String, confirmPassword: String)
    func onSuccess()
    func onFail(message: String)
}
protocol ISignupModel {
    func saveAuthDate(username: String, email: String,password: String, confirmPassword: String)
}
