//
//  UserDataTableViewController.swift
//  Checkup
//
//  Created by azab on 5/14/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class UserDataTableViewController: UITableViewController {
    
    var patientData : UserNeedToTakeSample?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ImgTableViewCell", bundle: nil), forCellReuseIdentifier: "imgCell")
        
        tableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "dataCell")
        
        //mapviewCell
        
         tableView.register(UINib(nibName: "MapViewTableViewCell", bundle: nil), forCellReuseIdentifier: "mapviewCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imgCell", for: indexPath) as! ImgTableViewCell
                        
            cell.patientImg.sd_setImage(with: URL(string: patientData?.imageURL ?? "placeholder.png"), placeholderImage:UIImage(named: "placeholder.png"))
                return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
            
            cell.nameLbl.text = patientData?.name
            cell.ageLbl.text = String("\(patientData!.age)")
            cell.addressLbl.text = patientData?.address
            cell.dateLbl.text = patientData?.date
            cell.timeLbl.text = patientData?.time
            cell.phoneLbl.text = ""
            for item in patientData?.phones ?? [""] {
                cell.phoneLbl.text?.append(item+"\n")
            }
            
             return cell
            
        } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "mapviewCell", for: indexPath) as! MapViewTableViewCell
                
                 return cell
            } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imgCell", for: indexPath) as! ImgTableViewCell
            
             return cell
        }
    }
    
}
