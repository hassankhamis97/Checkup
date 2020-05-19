//
//  SignupPresenter.swift
//  Checkup
//
//  Created by azab on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase

class SignupPresenter: ISignupPresenter {
    
    
    var userName:String!
    var email:String!
    
    var signupViewRef : ISignupView!
    init(signupViewRef : ISignupView) {
        self.signupViewRef = signupViewRef
    }
    
    func saveAuthDate(username: String, email: String, password: String) {
        signupViewRef.showIndicator()
        let signupModel = SignupModel(singupPresenterRef: self)
        signupModel.saveAuthDate(username: username, email: email, password: password)
    }
    
    func onSuccess() {
         signupViewRef.hideIndicator()
        
       
    }
    
    func onFail(message: String) {
        signupViewRef.errorMessage(msg: message)
        signupViewRef.hideIndicator()
    }
}
