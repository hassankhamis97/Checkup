//
//  SignUpTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import UIColor_Hex_Swift
import TransitionButton

class SignUpTableViewController: UITableViewController{
    
    @IBOutlet weak var signupBtn: TransitionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       signupBtn.layer.cornerRadius=30
    signupBtn.layer.borderColor=UIColor.white.cgColor
       signupBtn.layer.borderWidth=2
    }
    
 
       
        
    }
    
  
    

