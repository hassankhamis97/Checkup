//
//  RequestStatusTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class RequestStatusTableViewController: UITableViewController {

    @IBOutlet weak var precautionsTextArea: UITextView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

     super.viewDidLoad()
             
        precautionsTextArea.layer.borderWidth=2
        precautionsTextArea.layer.cornerRadius=10
        precautionsTextArea.layer.borderColor=UIColor.darkGray.cgColor
        
        

           }
           
        

}
