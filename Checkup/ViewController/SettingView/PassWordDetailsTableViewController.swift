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
        
        if self.validatePassword() {
            navigationController?.popViewController(animated: true)
        }
        else {
            let alert = UIAlertController(title: "Enter Valid Password", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        }
        
    }
    
    func validatePassword()->Bool {
        
        if oldPasswordLbl.text!.count >= 6 && newPasswordLbl.text!.count >= 6 && newPasswordLbl.text == confirmNewPasswordLbl.text {
            Auth.auth().currentUser?.updatePassword(to: newPasswordLbl.text!)
                
            { (error) in}
            return true
        } else {
            return false
        }
    }
    
}
