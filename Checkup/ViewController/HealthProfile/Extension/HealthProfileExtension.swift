//
//  HealthProfileExtension.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/3/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension HealthProfileTableViewController:UICollectionViewDelegate,UICollectionViewDataSource{
func numberOfSections(in collectionView: UICollectionView) -> Int {
    // 1
    return 1
}


func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // 2
    if(dieaseNamesArray.isEmpty || dieaseNamesArray==nil)
    {
        return 0
    }
    else{
        return dieaseNamesArray.count
    }
}


func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
    
    
    cell.testCell.text=dieaseNamesArray[indexPath.row]
     cell.deleteBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
     cell.deleteBtn.tag=indexPath.item
    
    return cell
    
}
    
    @objc func buttonPressed(_ sender: UIButton)
       {
           print("buttonPressed ! \(sender.tag)")
         dieaseNamesArray.remove(at: sender.tag)
           collectionView.reloadData()
           tableView.reloadData()
       }
    
    
    
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        if (indexPath.row==0){
            return 168
        }
        
        if (indexPath.row==1 || indexPath.row==2 || indexPath.row==3 || indexPath.row==4 ){
            return 178
        }
        
        if (indexPath.row==5){
                   return 164
               }
        
        if (indexPath.row==6){
            
            if (dieaseNamesArray.count>0)
            {
                return 82
            }
            else{
                return 0
            }
               }
        
        if (indexPath.row==7){
            return 76
        }
        
         return tableView.rowHeight
    }
    
}
