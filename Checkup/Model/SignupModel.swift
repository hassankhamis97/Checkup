//
//  SignupModel.swift
//  Checkup
//
//  Created by azab on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class SignupModel: ISignupModel {
    
    var singupPresenterRef : ISignupPresenter
    init(singupPresenterRef : ISignupPresenter) {
        self.singupPresenterRef = singupPresenterRef
    }
    func saveAuthDate(username: String, email: String, password: String, confirmPassword: String) {
        
        
        if username.count == 0 && email.count == 0 && (password.count < 6 || password != confirmPassword ) {
            
            self.singupPresenterRef.onFail(message: "Invalid Data")
        } else {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let x = error {
                    let err = x as NSError
                    switch err.code {
                    case AuthErrorCode.wrongPassword.rawValue:
                        print("wrong password")
                        self.singupPresenterRef.onFail(message: "wrong password")
                    case AuthErrorCode.invalidEmail.rawValue:
                        print("invalid email")
                        self.singupPresenterRef.onFail(message: "invalid email")
                    case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                        print("accountExistsWithDifferentCredential")
                        self.singupPresenterRef.onFail(message: "accountExistsWithDifferentCredential")
                    case AuthErrorCode.emailAlreadyInUse.rawValue:
                        print("email is alreay in use")
                        self.singupPresenterRef.onFail(message: "email is alreay in use")
                    default:
                        print("unknown error: \(err.localizedDescription)")
                        self.singupPresenterRef.onFail(message: "Invalid Data")
                    }
                    
                    self.singupPresenterRef.onFail(message: "Email is already exist")
                }
                else if authResult != nil {
                    
                    let id = authResult?.user.uid
                    let phoneArray=[Phone]()
                    let addressObj=Address()
                    let realTime=RealTime()
                    realTime.addUser(id: id ?? "", email: email, birthdate: "", gender: "", phone: phoneArray, insurance: "", address: addressObj, imagePath: "", name: username)
                    
                    self.singupPresenterRef.onSuccess()
//                    self.singupPresenterRef.onFail(message: "user created successfully")
//                    self.singupPresenterRef.onSuccess()
                }
            }
        }
    }
}
