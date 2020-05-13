//
//  MainViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 4/24/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Firebase
class MainViewController: UIViewController {
   @available(iOS 13.0, *)
    @IBAction func gotoSignup(_ sender: Any) {
       let signUpSVC = storyboard!.instantiateViewController(withIdentifier: "signRefstoryBoard") as! SignupViewController
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
//        var ref: DatabaseReference!
//        ref = Database.database().reference()
//
//        ref.child("Tests").child("0G9djW7SzMXGTiXKdGkiYuiTY3g1").observeSingleEvent(of: .value, with: { (snapshot) in
//          // Get user value
//          let value = snapshot.value as? NSDictionary
//
//          let username = value?["-M5j2KV4Wz74yZfJY1Dr"] as? NSDictionary
//          let id = username?["description"] as? String ?? ""
//print(id)
          // ...
//          }) { (error) in
//            print(error.localizedDescription)
//        }
        // Do any additional setup after loading the view.
    }
    


  

}
