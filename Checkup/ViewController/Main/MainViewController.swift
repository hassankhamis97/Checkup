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
       let signUpSVC = storyboard!.instantiateViewController(identifier: "signUpSVC") as SignUpTableViewController
    navigationController?.pushViewController(signUpSVC, animated: true)
    }
    @IBAction func gotoLogin(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
