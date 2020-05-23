//
//  NewRequestResponseExtension.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension NewRequestTableViewController : INewRequestView ,IView {
    func updateView() {
//        Toast.show(message: "request send Successfully", controller: self)
        showToast(message: "request sent") // change it to view controller success 
        navigationController?.popViewController(animated: true)
    }
    
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

    }
    
    func errorMessage(msg: String) {
        Alert.showSimpleAlert(title: "sorry".localized,message: msg, viewRef: self)
    }
    
    func checkValidation() -> Bool {
        var message: String = ""
        if(DatabaseImageArray.count == 0 && testTexts.count == 0){
            message = "please insert at least photo or test Name"
        }
        else if dateTextField.text!.isEmpty{
//            message = NSLocalizedString("alertDateMessageError", comment: "")
            message = "alertDateMessageError"
        }
        else if timeTextField.text!.isEmpty{
            message = "time is required"
        }
//        else if (isFromHome! && address.text!.isEmpty){
//            message = "address is required"
//        }
        if !message.isEmpty {
            Alert.showSimpleAlert(title: "sorry", message: message, viewRef: self)
            return false
        }
        return true
    }
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 8.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
