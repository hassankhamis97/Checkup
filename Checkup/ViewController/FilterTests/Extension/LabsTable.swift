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
    func numberOfSections(in tableView: UITableView) -> Int {
        var numOfSections: Int = 0
        if(isWaitingData){
            //            let activityView = UIActivityIndicatorView(style: .whiteLarge)
            //            activityView.center = self.view.center
            //            activityView.startAnimating()
            //
            //            self.view.addSubview(activityView)
            //            var activityView = UIActivityIndicatorView(style: .whiteLarge)
            //            activityView.center = self.view.center
            //            tableView.addSubview(activityView)
            //            activityView.startAnimating()
            //            numOfSections = 0
            numOfSections = 0
            tableView.separatorStyle  = .none
            tableView.showActivityIndicator()
        }
        else{
            if labsList.count > 0
            {
                //                    tableView.separatorStyle = .singleLine
                numOfSections = 1
                tableView.backgroundView = nil
            }
            else
            {
                numOfSections = 0
                let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
                noDataLabel.text          = errorMsg
                tableView.separatorStyle  = .none

                //            noDataLabel.textColor     = UIColor.black
                noDataLabel.textAlignment = .center
                tableView.backgroundView  = noDataLabel
                
            }
        }
        return numOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return labsList.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "labCell", for: indexPath) as! SmallDescLabTableViewCell
        cell.checkedIcon.tag = indexPath.item
        cell.checkedIcon.addTarget(self, action: #selector(changeSelectorBtn), for: .touchUpInside)
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
        let currentCell = tableView.cellForRow(at: indexPath) as! SmallDescLabTableViewCell
        
        changeSelectedLab(index: indexPath.row, sender: currentCell.checkedIcon)
        //        labsList[indexPath.row].isChecked = !labsList[indexPath.row].isChecked!
        //        if labsList[indexPath.row].isChecked! {
        //            testFilter?.labIds?.append(labsList[indexPath.row].id!)
        //        }
        //        else {
        //            for i in 0..<testFilter!.labIds!.count {
        //                if labsList[indexPath.row].id! == testFilter!.labIds![i]{
        //                testFilter?.labIds?.remove(at: i)
        //                    break
        //                }
        ////                testFilter?.labIds?.remove(i)
        //            }
        //        }
        //        tableViewOutlet.reloadData()
    }
    @objc func changeSelectorBtn(_ sender : UIButton){
        
        changeSelectedLab(index: sender.tag,sender: sender)
        
        
//        labsList[sender.tag].isChecked = !labsList[sender.tag].isChecked!
        
        
    }
    func changeSelectedLab(index: Int, sender: UIButton) {
        sender.pulsate()
        labsList[index].isChecked = !labsList[index].isChecked!
        if index == 0 {
            if labsList[index].isChecked == true {
            for i in 1..<labsList.count {
                testFilter?.labIds?.append(labsList[i].id!)
                labsList[i].isChecked = true
            }
            }
            else {
                for i in 1..<labsList.count {
                    testFilter?.labIds?.removeAll()
                    labsList[i].isChecked = false
                }
            }
            tableViewOutlet.reloadData()
        }
        else {
        if labsList[index].isChecked! {
            testFilter?.labIds?.append(labsList[index].id!)
            sender.setImage(UIImage(named: "checked"), for: .normal)
            if testFilter!.labIds!.count == labsList.count - 1 {
                labsList[0].isChecked = true
                tableViewOutlet.reloadData()
            }
        }
        else {
            for i in 0..<testFilter!.labIds!.count {
                
                if labsList[index].id! == testFilter!.labIds![i]{
                    testFilter?.labIds?.remove(at: i)
                    sender.setImage(UIImage(named: "unchecked"), for: .normal)
                    if testFilter!.labIds!.count == labsList.count - 2 {
                        labsList[0].isChecked = false
                        tableViewOutlet.reloadData()
                    }
                    break
                }
                //                testFilter?.labIds?.remove(i)
            }
        }
        }
//        tableViewOutlet.reloadData()
    }
}
