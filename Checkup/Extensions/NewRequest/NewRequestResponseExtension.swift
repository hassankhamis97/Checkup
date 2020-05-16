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
        
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func errorMessage(msg: String) {
        
    }
    
    func checkValidation() -> Bool {
        var message: String = ""
        if(DatabaseImageArray.count == 0 && testTexts.count == 0){
            message = "please insert at least photo or test Name"
        }
        else if dateTextField.text!.isEmpty{
            message = "date is required"
        }
        else if timeTextField.text!.isEmpty{
            message = "time is required"
        }
//        else if (isFromHome! && addressObj.text!.isEmpty){
//            message = "address is required"
//        }
        if !message.isEmpty {
            Alert.showValidationAlert(message: message, viewRef: self)
            return false
        }
        return true
    }

}
