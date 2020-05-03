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

    // MARK: - Table view data source
    @IBAction func signUpBtn(_ sender: Any) {
        
        
        if #available(iOS 13.0, *) {
            let profileRVC = self.storyboard!.instantiateViewController(identifier: "newReqSVCStoryBoard") as! newRequestTableViewController
            
            navigationController?.pushViewController(profileRVC, animated: true)
            
            
            
        } else {
            // Fallback on earlier versions
        }
        
                               
        
//    signUpBtn.startAnimation()
//
//        let qualityOfServiceClass = DispatchQoS.QoSClass.background
//        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
//        backgroundQueue.async(execute: {
//
//            sleep(3) // 3: Do your networking task or background work here.
//
//            DispatchQueue.main.async(execute: { () -> Void in
//
//                self.signUpBtn.stopAnimation(animationStyle: .expand, completion: {
//
//
//                    if #available(iOS 13.0, *) {
//                        let profileRVC = self.storyboard!.instantiateViewController(identifier: "editSvc") as! EditProfileTableViewController
//
//                        self.navigationController?.pushViewController(profileRVC, animated: true)
//                    } else {
//                        // Fallback on earlier versions
//                    }
//
//
//                })
//
//            })
//        })
    }
    
    

}
