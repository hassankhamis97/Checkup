//
//  SettingTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Firebase

class SettingTableViewController: UITableViewController {

    
    @IBOutlet weak var privacyLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        
//        let attachment = NSTextAttachment()
//        attachment.image = UIImage(named: "Settings_50px")
//        let attachmentString = NSAttributedString(attachment: attachment)
//        let myString = NSMutableAttributedString(string: "price")
//        myString.append(attachmentString)
//        privacyLabel.attributedText = myString
 
    
    }

    // MARK: - Table view data source

  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        if indexPath.row==0
        {
         let vc = storyboard!.instantiateViewController(withIdentifier: "privacySVC") as! PrivacyTableViewController
            navigationController?.pushViewController(vc, animated: true)

           
        }
        
        if indexPath.row==1
              {
                  print ("1")
              }
        if indexPath.row==2
              {
                  print ("2")
              }
        if indexPath.row==3
              {
                  print ("log")
              }
        
}
}


