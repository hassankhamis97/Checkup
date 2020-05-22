//
//  HomeExtention.swift
//  Checkup
//
//  Created by azab on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit

extension HomeTableViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, IGetLabsView {
    
    
    
    func getLabsForRender(homeLabs: [HomeLab]) {
        homeLabArr = homeLabs
        labCollection.reloadData()
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func errorMessage(msg: String) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeLabArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labCell", for: indexPath) as! LabsCollectionViewCell
        
        cell.labImageVIew.image = UIImage(named: homeLabArr?[indexPath.row].labPhoto ?? "")
        cell.labRating.rating =  (homeLabArr?[indexPath.row].rating as! NSString).doubleValue
        cell.labHotLine.text = homeLabArr?[indexPath.row].hotline
        //cell.labImageVIew.layer.cornerRadius = cell.labImageVIew.frame.height/2
        cell.labImageVIew.layer.cornerRadius = 15
        //        cell.labRating.rating = 3
        
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.borderWidth = 5.0
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var labDesc = storyboard?.instantiateViewController(withIdentifier: "labDescSCV")as! LabDescTableViewController
        navigationController?.pushViewController(labDesc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView.bounds.maxY >= collectionView.contentSize.height && reach == false {
            
            print("reached")
            reach = true
        } else if collectionView.bounds.maxY >= collectionView.contentSize.height && reach == true {
            
            reach = false
        }
    }
    
}
