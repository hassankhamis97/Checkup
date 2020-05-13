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
       let signUpSVC = storyboard!.instantiateViewController(identifier: "signRefstoryBoard") as! SignupViewController
    navigationController?.pushViewController(signUpSVC, animated: true)

   

    }
    
    
     @available(iOS 13.0, *)
    @IBAction func goToHome(_ sender: Any) {
        let homeSVC = storyboard!.instantiateViewController(identifier: "homeSVCStoryBoard") as! HomeTableViewController
        navigationController?.pushViewController(homeSVC, animated: true)
        
    }
    
    
    
    @IBAction func gotoLogin(_ sender: Any) {
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


  

}
