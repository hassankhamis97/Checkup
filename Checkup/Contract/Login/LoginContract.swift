//
//  LoginContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

protocol ILoginView : IBase {
    func userValidation ()
}
protocol ILoginPresenter {
    func checkUser(email: String,password: String)
    func onSuccess()
    func onFail(message: String)
}
protocol ILoginModel {
    func checkUser(email: String,password: String)
}
