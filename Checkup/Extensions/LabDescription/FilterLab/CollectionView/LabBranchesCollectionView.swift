//
//  LabBranchesCollectionView.swift
//  Checkup
//
//  Created by Aya on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension LabDescTableViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (labDescriptionObj.branches == nil){
            return 0
        }else{
        return labDescriptionObj.branches!.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "branchCell", for: indexPath) as! BranchesCollectionViewCell
        cell.requestBtnOutlet.tag = indexPath.item
        cell.requestBtnOutlet.addTarget(self, action: #selector(newRequestAction), for: .touchUpInside)
        cell.isSelected = true
        let convertedDiestance = String(labDescriptionObj.branches![indexPath.item].distance!)
        
        cell.governNameOutlet.text = labDescriptionObj.branches![indexPath.item].govern
        cell.ratingOutlet.rating = labDescriptionObj.branches![indexPath.item].rating!
        cell.distanceOutlet.text = convertedDiestance
       // cell.branchDescOutlet.text = labDescriptionObj.branches![indexPath.item].address?.address as! String
        return cell
        
    }
    @objc func newRequestAction(_ sender : UIButton){
        sender.pulsate()
        if(true) { //check if branch has from home feature or not
            let reqLocPopUpVC = storyboard!.instantiateViewController(withIdentifier: "ReqPopUpFromHomeSVC") as! ReqPopUpFromHomeViewController
            reqLocPopUpVC.showNewRequestRef = self
            present(reqLocPopUpVC, animated: true, completion: nil)
        }
        else{
            transferToNewReq(isFromHome: false)
        }

    
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolled")
     //   labDescPresenter.getDataFromLabDescModel()
       
        
        //abDescProtocolObj!.paginatingData()
    }
      

}









 /*
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        print("called")
        return true
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }*/
    
 /*   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("cell is selected")
//        var details = storyboard!.instantiateViewController(withIdentifier: "detailsVC") as! DetailsViewController
//        self.navigationController?.pushViewController(details, animated: true)
    }*/
     
    
 
 

