//
//  SignupResponseExtension.swift
//  Checkup
//
//  Created by azab on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit


@available(iOS 13.0, *)
extension SignupTableViewController: ISignupView {
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        activityIndicator.show()
    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        activityIndicator.hide()
    }
    
    func errorMessage(msg: String) {
        
    }
    
    
}
