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

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class SignupTableViewController: UITableViewController {

    
    
    
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius=30
        signUpBtn.layer.borderColor=UIColor.white.cgColor
        signUpBtn.layer.borderWidth=2

    }

  
    }
    
    


