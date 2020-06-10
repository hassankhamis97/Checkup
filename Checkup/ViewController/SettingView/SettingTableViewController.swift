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
      var x =  LocalizationSystem.sharedInstance.getLanguage()
             print(x)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
        
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
                 let vc = storyboard!.instantiateViewController(withIdentifier: "languageSVC") as!LanguageTableViewController
                                                          navigationController?.pushViewController(vc, animated: true)

              }
        
        
        
    
        
}
}


