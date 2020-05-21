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

@available(iOS 13.0, *)
@available(iOS 13.0, *)

class SignupTableViewController: UITableViewController {
    
    
    @IBOutlet weak var userNAme: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var email: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var password: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var confirmPassword: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius=30
        signUpBtn.layer.borderColor=UIColor.white.cgColor
        signUpBtn.layer.borderWidth=2
    }
    
    @IBAction func saveDataSignupBtn(_ sender: Any) {
        
        let signPresenter : SignupPresenter = SignupPresenter(signupViewRef: self)
        if signPresenter.saveAuthDate(username: userNAme.text!, email: email.text!, password: password.text!, confirmPassword: confirmPassword.text! ) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}




