//
//  MoreTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/14/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MoreTableViewController: UITableViewController {

    
    @IBOutlet weak var profileImg: UIImageView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.cornerRadius=profileImg.frame.width/2

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row==0{
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "profileSVCRef") as! ProfileTableViewController
            
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        if indexPath.row==1{
            
            
            print("statistics")
        }
        
        
        if indexPath.row==2{
            
          let vc = storyboard?.instantiateViewController(withIdentifier: "settingSVCRef") as! SettingTableViewController
                    
                    navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
        
        
        if indexPath.row==3{
            
       print("logout")
            
        }
        
        
    }
 
    

}
