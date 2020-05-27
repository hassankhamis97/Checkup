//
//  ResetPasswordViewController.swift
//  Checkup
//
//  Created by azab on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailInfoTxt: UILabel!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    @IBOutlet weak var emailTxtFeild: UITextField!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        errorLbl.isHidden = true
       
        emailInfoTxt?.text = "RESET_PASSWORD_EnterEmail".localized
        errorLbl?.text = "RESET_PASSWORD_ValidEmail".localized
        resetBtn?.setTitle("RESET_PASSWORD_Reset".localized, for: .normal)
        cancelBtn?.setTitle("RESET_PASSWORD_Cancel".localized, for: .normal)
    }
    
    @IBAction func resetPasswordBtn(_ sender: Any) {
        
        //reset password
        if emailTxtFeild.text!.count > 0 {
            Auth.auth().sendPasswordReset(withEmail:emailTxtFeild.text!) { error in}
            self.dismiss(animated: true, completion: nil)
        } else {
            errorLbl.isHidden = false
        }
    }
    
    @IBAction func cancelReset(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
