//
//  LoginTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/26/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import TransitionButton
import SkyFloatingLabelTextField
import UIColor_Hex_Swift
class LoginTableViewController: UITableViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var emailTextView: SkyFloatingLabelTextFieldWithIcon!
    
         @IBOutlet weak var LoginBtn: TransitionButton!
    @IBOutlet weak var passWordTextView: SkyFloatingLabelTextFieldWithIcon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginBtn.layer.cornerRadius=30
        LoginBtn.layer.borderColor=UIColor.white.cgColor
        LoginBtn.layer.borderWidth=2

}
    


  
    @IBAction func LoginBtn(_ sender: Any) {
        
        
        LoginBtn.startAnimation()
       
               let qualityOfServiceClass = DispatchQoS.QoSClass.background
               let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
              backgroundQueue.async(execute: {

                             sleep(3) // 3: Do your networking task or background work here.

                             DispatchQueue.main.async(execute: { () -> Void in
                                
                                self.LoginBtn.stopAnimation(animationStyle: .expand, completion: {

                                    
                                    if #available(iOS 13.0, *) {
                                        let signupRVC = self.storyboard!.instantiateViewController(identifier: "secondVC") as! SplashViewController

                                self.navigationController?.pushViewController(signupRVC, animated: true)
                                    } else {
                                        // Fallback on earlier versions
                                    }
                                         
                                    
                                       })

                             })
                         })
          }
        
    }
    
  
    
