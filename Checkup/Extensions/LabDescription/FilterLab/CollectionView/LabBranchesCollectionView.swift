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
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 1.0
      }*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labBranches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "branchCell", for: indexPath) as! BranchesCollectionViewCell
        cell.requestBtnOutlet.tag = indexPath.item
        cell.requestBtnOutlet.addTarget(self, action: #selector(newRequestAction), for: .touchUpInside)
        return cell
        
    }
    @objc func newRequestAction(_ sender : UIButton){
//        var newRequestVC = storyboard!.instantiateViewController(withIdentifier: "newReqSVC") as! NewRequestTableViewController
        var newRequestVC = storyboard!.instantiateViewController(withIdentifier: "newReqSVC") as! NewRequestTableViewController
        newRequestVC.branchId = labBranches[sender.tag]
        self.navigationController?.pushViewController(newRequestVC, animated: true)
    }

 
/*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.labBrachCollection.bounds.width, height: self.labBrachCollection.bounds.height)
    }
 */
 
}
