//
//  LoginTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/26/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import TransitionButton
import SkyFloatingLabelTextField
import UIColor_Hex_Swift
class LoginTableViewController: UITableViewController,UITextFieldDelegate {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var emailTextView: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var passWordTextView: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var loginBtnOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loginBtnOutlet.layer.cornerRadius=30
        loginBtnOutlet.layer.borderColor=UIColor.white.cgColor
        loginBtnOutlet.layer.borderWidth=2
        
        
        // to enable return key
        emailTextView.delegate=self
        passWordTextView.delegate=self
        //
        
        // to enable hide key board when touching any where
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        activityIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
       activityIndicator.hide()
    }
    //  function to enable dimiss key board(Return key)
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    // function to enable dimiss key board(touch any where )
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    @IBAction func loginBtn(_ sender: Any) {
        if (emailTextView.text! != nil || emailTextView.text! != nil){
            var loginPresenter : LoginPresenter = LoginPresenter(loginViewRef: self)
            loginPresenter.checkUser(email: emailTextView.text!, password: passWordTextView.text!)
        //  Login code
        }
        else{
            
        }
    }
    
    
    
    
    
    
}


