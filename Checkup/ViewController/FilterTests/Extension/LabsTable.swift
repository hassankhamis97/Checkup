//
//  LabsTable.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension FilterTestViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "labCell", for: indexPath) as! SmallDescLabTableViewCell
        cell.labName.text = labsList[indexPath.row].name
        cell.checkedIcon.imageView?.contentMode = .scaleToFill

        if (labsList[indexPath.row].isChecked!) {
            cell.checkedIcon.setImage(UIImage(named: "checked"), for: .normal)
        }
        else{
            cell.checkedIcon.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        labsList[indexPath.row].isChecked = !labsList[indexPath.row].isChecked!
        if labsList[indexPath.row].isChecked! {
            testFilter?.labIds?.append(labsList[indexPath.row].id!)
        }
        else {
            testFilter?.labIds?.remove(at: indexPath.row)
        }
        tableViewOutlet.reloadData()
    }
    
}
