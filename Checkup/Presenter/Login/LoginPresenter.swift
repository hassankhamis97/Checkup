//
//  LoginPresenter.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class LoginPresenter: ILoginPresenter {
    
    var loginViewRef : ILoginView!
    init(loginViewRef : ILoginView) {
        self.loginViewRef = loginViewRef
    }
    func checkUser(email: String,password: String){
        loginViewRef.showIndicator()

        var loginModel = LoginModel(loginPresenterRef: self)
        loginModel.checkUser(email: email, password: password)
//        loginModel.
    }
    func onSuccess(){
        loginViewRef.userValidation()
        loginViewRef.hideIndicator()
    }
    func onFail(message: String){
        loginViewRef.errorMessage(msg: message)
        loginViewRef.hideIndicator()
    }
}
