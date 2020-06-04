//
//  EmailDetailTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseAuth

class EmailDetailTableViewController: UITableViewController, IView, IBase, UITextFieldDelegate {
    
    @IBOutlet weak var oldEmailTxtField: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var newEmailTxtField: SkyFloatingLabelTextField!
    
    
    @IBAction func UpdateEmailBtn(_ sender: Any) {
        
        
        if newEmailTxtField.text?.isEmpty ?? true {
            self.errorMessage(msg: "Enter your new Email")
        } else {
            showIndicator()
            let currentUser = Auth.auth().currentUser
            currentUser?.updateEmail(to: newEmailTxtField.text!) { error in
                if let error = error {
                    self.errorMessage(msg: error.localizedDescription)
                } else {
                    self.showToast(message: "Updated successfully ")
                }
                self.hideIndicator()
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        oldEmailTxtField.text = Auth.auth().currentUser?.email
        
        // to enable return key
        newEmailTxtField.delegate=self
        
        // to enable hide key board when touching any where
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
    }
    
    // function to enable dimiss key board(touch any where )
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //  function to enable dimiss key board(Return key)
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func errorMessage(msg: String) {
        Alert.showSimpleAlert(title: "sorry", message: msg, viewRef: self)
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
