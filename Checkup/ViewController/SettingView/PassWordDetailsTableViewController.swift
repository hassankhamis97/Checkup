//
//  PassWordDetailsTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import FirebaseAuth
import SkyFloatingLabelTextField

class PassWordDetailsTableViewController: UITableViewController {

    @IBOutlet weak var oldPasswordLbl: SkyFloatingLabelTextField!
    
    @IBOutlet weak var newPasswordLbl: SkyFloatingLabelTextField!
    
    @IBOutlet weak var confirmNewPasswordLbl: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

  
    }

   @IBAction func DoneBtn(_ sender: Any) {
    
//    ToastView.shared.short(self.view, txt_msg: "Done!")
   
    self.validatePassword()
    navigationController?.popViewController(animated: true)
   }

    func validatePassword() {
        if oldPasswordLbl.text!.count >= 6 {
            if newPasswordLbl.text!.count >= 6 && newPasswordLbl.text == confirmNewPasswordLbl.text {
                Auth.auth().currentUser?.updatePassword(to: newPasswordLbl.text!)
                    
                { (error) in
                    
                }
            }
        }
    }
    
}
