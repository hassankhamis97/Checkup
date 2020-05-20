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
    func saveAuthDate(username: String, email: String, password: String, confirmPassword: String) -> Bool {
        
        var check: Bool = false
        var myMsg: String = "Enter Vaild Data"
        
        if username.count > 0 && email.count > 0 && password.count >= 6 && password == confirmPassword {
            
            check = false
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let x = error {
                    let err = x as NSError
                    switch err.code {
                    case AuthErrorCode.wrongPassword.rawValue:
                        print("wrong password")
                    case AuthErrorCode.invalidEmail.rawValue:
                        print("invalid email")
                    case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                        print("accountExistsWithDifferentCredential")
                    case AuthErrorCode.emailAlreadyInUse.rawValue: //<- Your Error
                        print("email is alreay in use")
                    default:
                        print("unknown error: \(err.localizedDescription)")
                    }
                    check = false
                }
                if authResult != nil {
                    
                    let id = authResult?.user.uid
                    let phoneArray=[Phone]()
                    let addressObj=Address()
                    let realTime=RealTime()
                    realTime.addUser(id: id ?? "", email: email, birthdate: "", gender: "", phone: phoneArray, insurance: "", address: addressObj, imagePath: "", name: username)
                    
                    self.singupPresenterRef.onSuccess()
                    check = true
                }
                else {
                    //                    self.singupPresenterRef.onFail(message: "Email is already exist")
                    myMsg = "email is alreay in use"
                    check = false
                }
            }
//            if !check {
//                self.singupPresenterRef.onFail(message: "Email is alreay in use")
//            }
            return check
        } else {
            self.singupPresenterRef.onFail(message: myMsg)
            return check
        }
    }
    
}
