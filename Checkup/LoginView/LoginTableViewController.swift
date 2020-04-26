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
    
    @IBOutlet weak var passWordTextView: SkyFloatingLabelTextFieldWithIcon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        emailTextView.tintColor = UIColor.brown // the color of the blinking cursor
//        emailTextView.textColor =  UIColor("#825BA0")
////        emailTextView.lineColor=UIColor("#B8D7D8")
//
//        emailTextView.selectedTitleColor = UIColor.green

        
        
//        passWordTextView.tintColor = UIColor.brown // the color of the blinking cursor
//               passWordTextView.textColor = UIColor("#825BA0")
////        passWordTextView.lineColor=
//
////               passWordTextView.lineColor=UIColor("#B8D7D8")
//
//               passWordTextView.selectedTitleColor = UIColor.green
}
    

     @IBOutlet weak var LoginBtn: TransitionButton!
  
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
    
  
    
