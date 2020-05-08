//
//  SignupTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/1/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import TransitionButton

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class SignupTableViewController: UITableViewController {
    @IBOutlet weak var signUpBtn: TransitionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius=30
        signUpBtn.layer.borderColor=UIColor.white.cgColor
        signUpBtn.layer.borderWidth=2

    }

  
    }
    
    


