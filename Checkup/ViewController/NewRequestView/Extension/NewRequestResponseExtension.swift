//
//  NewRequestResponseExtension.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension NewRequestTableViewController : INewRequestView ,IView , IViewAdvancedAlert{
    func pressOk() {
        let ref=self.storyboard?.instantiateViewController(withIdentifier:"editSvc") as! EditProfileTableViewController
                
        //        ref.user=user
                
                    navigationController?.pushViewController(ref, animated: true)
    }
    
    func pressCancel() {
        
    }
    
    func updateView() {
//        Toast.show(message: "request send Successfully", controller: self)
        showToast(message: "request sent") // change it to view controller success
        Alert.showSimpleAlert(title: "Alert", message: "your request sent successfully", viewRef: self)
        navigationController?.popViewController(animated: true)
    }
    
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        activityIndicator.show()
        activityIndicator.alpha = 1
        saveRequestBtn.alpha = 0

    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.hide()
        activityIndicator.alpha = 0
        saveRequestBtn.alpha = 1

    }
    
    func errorMessage(msg: String) {
        Alert.showSimpleAlert(title: "sorry",message: msg, viewRef: self)
    }
    
    func checkValidation() -> Bool {
//        var hasPhone = false
//        if user.phone != nil {
//
//        }
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
        else if (isFromHome! && addressObj == nil){
            message = "address is required"
        }
        else if ((user.phone?.count == 0 || (user.phone![0].number! == "" && user.phone![1].number! == "")) || user.birthdate == "" || user.gender == ""){
                    Alert.showAdvancedAlert(title: "Complete your profile", message: "make sure that you entered your phone, birthdate and gender", viewAdvancedAlertRef: self)
                    return false
        //            message = "address is required"
                }
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
