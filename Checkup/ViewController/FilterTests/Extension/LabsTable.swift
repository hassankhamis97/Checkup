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
        let cell = tableView.dequeueReusableCell(withIdentifier: "labCell", for: indexPath) as! SmallDescLabTableViewCell
        cell.labName.text = labsList[indexPath.row].name
        if (labsList[indexPath.row].isChecked!) {
            cell.checkedIcon.setImage(UIImage(named: "checked"), for: .normal)
            cell.checkedIcon.imageView?.contentMode = .scaleToFill
        }
        else{
            cell.checkedIcon.setImage(UIImage(named: "unchecked"), for: .normal)
            cell.checkedIcon.imageView?.contentMode = .scaleToFill
        }
        return cell
    }
    
    
}
