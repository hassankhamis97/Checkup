//
//  SettingTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SettingTableViewController: UITableViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        if indexPath.row==0
        {
         let vc = storyboard!.instantiateViewController(identifier: "passWordSVC") as! PassWordDetailsTableViewController
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
