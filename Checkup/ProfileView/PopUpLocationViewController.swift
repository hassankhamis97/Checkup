//
//  PopUpLocationViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class PopUpLocationViewController: UIViewController {

    @IBAction func autoLocateBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func setManuallyBtn(_ sender: Any) {
        
         dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
