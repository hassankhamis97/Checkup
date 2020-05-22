//
//  LoginModel.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
class LoginModel: ILoginModel {
    var loginPresenterRef : ILoginPresenter
    init(loginPresenterRef : ILoginPresenter) {
        self.loginPresenterRef = loginPresenterRef
    }
    func checkUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if authResult != nil {
                //                authResult?.user.uid
                self.loginPresenterRef.onSuccess()
            }
            else {
                self.loginPresenterRef.onFail(message: error!.localizedDescription)
            }
        }
    }
}
