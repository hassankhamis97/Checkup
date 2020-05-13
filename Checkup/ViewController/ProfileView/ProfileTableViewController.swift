//
//  ProfileTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    @IBOutlet weak var profileImg: UIImageView!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.masksToBounds = false
        profileImg.layer.cornerRadius=profileImg.frame.width / 2
        profileImg.clipsToBounds = true

        
    }

   
    
    @IBAction func editProfileBtn(_ sender: Any) {
        
        if #available(iOS 13.0, *) {
            let ref=self.storyboard?.instantiateViewController(withIdentifier:"editSvc") as! EditProfileTableViewController
             navigationController?.pushViewController(ref, animated: true)
        } else {
            // Fallback on earlier versions
        }
        
       
    }
    
    
    

}
