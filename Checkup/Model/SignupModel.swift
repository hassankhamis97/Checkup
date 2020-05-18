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
    func saveAuthDate(username: String, email: String, password: String) {
        
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if authResult != nil {
                //                authResult?.user.uid
                self.singupPresenterRef.onSuccess()
            }
            else {
                self.singupPresenterRef.onFail(message: error as! String)
            }
        }
        
//        writeUserData(username: username, password: password)
    }
    
        
//        func writeUserData(username: String, password: String) {
//            Database.database().reference(withPath: "checkup-23ffe").child("Users").child(Auth.auth().currentUser!.uid).updateChildValues(["username": username, "password": password])
//          }
    
}
