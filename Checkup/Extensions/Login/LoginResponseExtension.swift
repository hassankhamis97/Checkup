//
//  LoginResponseExtension.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension LoginTableViewController : ILoginView {
//    var activityIndicator: UIActivityIndicatorView!
    func userValidation() {
        dismiss(animated: true, completion: nil)
    }
    
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        activityIndicator.show()
        loginBtnOutlet.alpha = 0
//        activityIndicator.startAnimating()
    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.hide()
//        activityIndicator.stopAnimating()
    }
    
    func errorMessage(msg: String) {
        
    }
    
    
}
