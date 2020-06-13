//
//  LabBranchesCollectionView.swift
//  Checkup
//
//  Created by Aya on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension LabDescViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout, UIScrollViewDelegate{


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (labDescriptionObj.branches == nil || isLoading == true || isError == true){
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
        let convertedDiestance = String(labDescriptionObj.branches![indexPath.item].distance!) + " km"
        
        
        cell.governNameOutlet.text = labDescriptionObj.branches![indexPath.item].govern
        cell.ratingOutlet.rating = labDescriptionObj.branches![indexPath.item].rating!
        cell.distanceOutlet.text = convertedDiestance
        cell.addressOutlet.text = String(labDescriptionObj.branches![indexPath.item].address!.buildingNo!) + labDescriptionObj.branches![indexPath.item].address!.address1!
       // cell.branchDescOutlet.text = labDescriptionObj.branches![indexPath.item].address?.address as! String
        return cell
        
    }
    @objc func newRequestAction(_ sender : UIButton){
        sender.pulsate()
//        let index = sender.tag
        
        if(labDescriptionObj.branches![sender.tag].isAvailableFromHome == true) { //check if branch has from home feature or not
            let reqLocPopUpVC = storyboard!.instantiateViewController(withIdentifier: "ReqPopUpFromHomeSVC") as! ReqPopUpFromHomeViewController
//            reqLocPopUpVC.
            reqLocPopUpVC.showNewRequestRef = self
            reqLocPopUpVC.elementIndex = sender.tag
            present(reqLocPopUpVC, animated: true, completion: nil)
        }
        else{
            transferToNewReq(isFromHome: false, index: sender.tag)
        }

    
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        //print("scrolled")
//        let contentOffsetY = scrollView.contentOffset.y
        let height = scrollView.frame.size.height
                    let contentYoffset = scrollView.contentOffset.y
                    let distanceFromBottom = scrollView.contentSize.height - contentYoffset
                    if isBottom == false && filteredGovernId == 0 && distanceFromBottom < height {
                        isBottom = true
                        print("scrolled")
                  
                    paginatingParams.skip =  labDescriptionObj.branches?.count
                    labDescPresenter.getDataFromLabDescModel(params: paginatingParams)
                    }
          let newHeaderHeight : CGFloat = headerViewHeight.constant-contentYoffset    // 276 - 76 = 200
        //        if newHeaderHeight !=  headerViewHeight.constant{
        //            newHeaderHeightFixed = newHeaderHeight
        //        }
                          if newHeaderHeight >= imageViewMaxHeight{ //200 >= 276
                                  headerViewHeight.constant = imageViewMaxHeight
                                    topViewConstraint.constant = topViewConstrainsMaxHeight
                              }else if newHeaderHeight < imageViewMinHeight{ //200 < 0
                                  headerViewHeight.constant = imageViewMinHeight
                                    topViewConstraint.constant = topViewConstrainsMinHeight
                              }else{
                //
        //                    labImageView.alpha = 1 - (((imageViewMaxHeight - newHeaderHeight)*(0.9)) / (imageViewMaxHeight - imageViewMinHeight))
        //                    labImageView.contentMode = .scaleAspectFill
                            if headerViewHeight.constant != newHeaderHeight {
                            topViewConstraint.constant =  topViewConstraint.constant -  (headerViewHeight.constant - newHeaderHeight)  // topViewConstrainsMaxHeight - offsetYFixed    -71
                            }
                                  headerViewHeight.constant = newHeaderHeight   //200
                            
                                  scrollView.contentOffset.y = 0
                              }
    }
   
    
   /* func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(indexPath.row == labDescriptionObj.branches!.count - 1){
            print("last cell is here")
           var paginatingParams: LabDescriptionParams = LabDescriptionParams()
   
            paginatingParams.governId = 1
            paginatingParams.labId = "-M7O-IStoBsiYrQFpwo_"
            paginatingParams.latitude = 31.1803167
            paginatingParams.longitude = 29.9137701
            paginatingParams.take = 6
            paginatingParams.skip = 0
          labDescPresenter.getDataFromLabDescModel(params: paginatingParams)
            
        }
    }*/
    
    
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let branchDesc = self.storyboard!.instantiateViewController(withIdentifier: "branch") as! BranchViewController
        branchDesc.modalPresentationStyle = .fullScreen
      
        branchDesc.branchId = labDescriptionObj.branches![indexPath.row].idFB
        
        self.present(branchDesc , animated: true , completion: nil)
        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = labBrachCollection.frame.size.height
        let width = labBrachCollection.frame.size.width
        if labDescriptionObj.branches!.count <= 0  {
//            if isLoading == false{
            return CGSize(width: width, height: height)
//            }
//            else {
//                return CGSize(width: 0, height: 0)
//            }
        }
            
            //
            //
        else if view.frame.size.width > view.frame.size.height {
            return CGSize(width: width * 0.24, height: 213)
        }
        else {
            return CGSize(width: width * 0.49, height: 213)
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        labBrachCollection.reloadData()
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
     
    
 
 

