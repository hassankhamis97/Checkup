//
//  MainViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 4/24/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
   @available(iOS 13.0, *)
    @IBAction func gotoSignup(_ sender: Any) {
       let signUpSVC = storyboard!.instantiateViewController(withIdentifier: "signRefstoryBoard") as! SignupViewController
    navigationController?.pushViewController(signUpSVC, animated: true)

   

    }
    @IBAction func gotoLogin(_ sender: Any) {
        
    }
    
    
    @IBAction func moveToUsers(_ sender: Any) {
        
        let userTVC = storyboard?.instantiateViewController(withIdentifier: "userRSB") as!
        UsersTableViewController
        
        navigationController?.pushViewController(userTVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


  

}
