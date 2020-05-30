//
//  ResetPasswordTableViewController.swift
//  Checkup
//
//  Created by azab on 5/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseAuth

class ResetPasswordTableViewController: UITableViewController {
    
    @IBOutlet weak var emailTxtFeold: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLbl.isHidden = true
    }
    
    @IBAction func cancelReseting(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        
        if emailTxtFeold.text?.count ?? 0 <= 0 {
            errorLbl.isHidden = false
        } else {
            Auth.auth().sendPasswordReset(withEmail:emailTxtFeold.text!) { error in}
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
