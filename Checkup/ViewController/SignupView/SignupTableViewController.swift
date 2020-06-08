//
//  SignupTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/1/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

/*
 Notes :
 outlet from sign up button only , no action
 
 */


import UIKit
import SkyFloatingLabelTextField
import Firebase

class SignupTableViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var signupActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var userName: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var email: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var password: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var confirmPassword: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupActivity.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        signUpBtn.layer.cornerRadius=10
        signUpBtn.layer.borderColor=UIColor.white.cgColor
        signUpBtn.layer.borderWidth=2
        
        
        userName.delegate=self
        email.delegate=self
        password.delegate=self
        confirmPassword.delegate=self
        //
        
        // to enable hide key board when touching any where
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
//        userName.placeholder = "SIGN_UP_NAME".localized
//        email.placeholder = "SIGN_UP_Email".localized
//        password.placeholder = "SIGN_UP_Password".localized
//        confirmPassword.placeholder = "SIGN_UP_ConfirmPassword".localized
//        signUpBtn.setTitle("SIGN_UP_signup".localized, for: .normal)
    }
    
    @IBAction func saveDataSignupBtn(_ sender: Any) {
        
        
        if ( checkValidation()){
            signUpBtn.isHidden = true
             let signPresenter : SignupPresenter = SignupPresenter(signupViewRef: self)
            signPresenter.saveAuthDate(username: userName.text!, email: email.text!, password: password.text!, confirmPassword: confirmPassword.text! )
        }
        
    }
    func checkValidation() -> Bool {
    //        var hasPhone = false
    //        if user.phone != nil {
    //
    //        }
            var message: String = ""
        if userName.text!.count == 0 {
                message = "Name is Required"
            }
            
        else if email.text!.count == 0 {
    //            message = NSLocalizedString("alertDateMessageError", comment: "")
                message = "Email is Required"
            }
            else if password.text!.isEmpty {
                message = "Password is Required"
            }
            else if password.text!.count <= 6 {
                message = "Password must be more than 6 characters"
            }
        else if password.text! != confirmPassword.text! {
                message = "confirmPassword does not match Password"
            }
            
            if !message.isEmpty {
                Alert.showSimpleAlert(title: "sorry", message: message, viewRef: self)
                return false
            }
            return true
        }
  func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
      self.view.endEditing(true)
      return true
  }
  
  
  // function to enable dimiss key board(touch any where )
  @objc func dismissKeyboard() {
      view.endEditing(true)
  }
    
}




