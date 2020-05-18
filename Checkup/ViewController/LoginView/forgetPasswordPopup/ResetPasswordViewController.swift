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

    
    @IBOutlet weak var emailTxtFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetPasswordBtn(_ sender: Any) {
        
            //reset password
        if emailTxtFeild.text!.count > 0 {
            Auth.auth().sendPasswordReset(withEmail:emailTxtFeild.text!) { error in}
        }
        self.dismiss(animated: true, completion: nil)
    }
}
