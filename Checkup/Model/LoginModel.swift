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
                var message: String!
                switch error!.localizedDescription {
                case "There is no user record corresponding to this identifier. The user may have been deleted.":
                    message = error!.localizedDescription
                    break
                    case "The email address is badly formatted.":
                                        message = error!.localizedDescription
                                        break
                    case "The password is invalid or the user does not have a password.":
                                        message = error!.localizedDescription
                                        break
                default:
                    message = "An error occured please try again later"
                }
                self.loginPresenterRef.onFail(message: message)
            }
        }
    }
}
