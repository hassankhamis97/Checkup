//
//  SignupResponseExtension.swift
//  Checkup
//
//  Created by azab on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

extension SignupTableViewController: ISignupView, IView {
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        signupActivity.show()
        signupActivity.startAnimating()
    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        signupActivity.stopAnimating()
        signupActivity.hide()
    }
    
    func errorMessage(msg: String) {
        hideIndicator()
        signUpBtn.isHidden = false
        Alert.showSimpleAlert(title: "sorry", message: msg, viewRef: self)
    }
    
    func enterToApp() {
        hideIndicator()
        if Auth.auth().currentUser != nil {
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
}
