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
extension SignupTableViewController: ISignupView, IView {
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //        activityIndicator.show()
    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        //        activityIndicator.hide()
    }
    
    func errorMessage(msg: String) {
        Alert.showSimpleAlert(title: "Sorry", message: msg, viewRef: self)
    }
    
    func enterToApp() {
        
        self.dismiss(animated: true, completion: nil)
//        guard let homeSB = self.storyboard?.instantiateViewController(withIdentifier: "homeSVC") else { return }
//         present(homeSB, animated: true, completion: nil)
//        navigationController?.pushViewController(homeSB, animated: true)
    }
}
