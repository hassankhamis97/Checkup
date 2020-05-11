//
//  MessagingTableView.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension MessagingChatViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row%2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SenderCellTableViewCell
                    
            //        cell.textLabel?.text = "ay 7agaaa"
                    // Configure the cell...
                    cell.myLabel.text = "ayyyay"
                    return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "recieverCell", for: indexPath) as! RecieverCellTableViewCell
                    
            //        cell.textLabel?.text = "ay 7agaaa"
                    // Configure the cell...
                    cell.recieverLabel.text = "gfdf"
                    return cell
        }
        
    }
    
    
}
