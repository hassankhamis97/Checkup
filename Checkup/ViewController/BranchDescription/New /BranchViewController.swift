//
//  BranchViewController.swift
//  Checkup
//
//  Created by Aya on 6/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class BranchViewController: UIViewController{
  
    @IBAction func requestBtn(_ sender: UIButton) {
        if(isAvailableFromHome == true) { //check if branch has from home feature or not
                    let reqLocPopUpVC = storyboard!.instantiateViewController(withIdentifier: "ReqPopUpFromHomeSVC") as! ReqPopUpFromHomeViewController
        //            reqLocPopUpVC.
                    reqLocPopUpVC.showNewRequestRef = labDescRef
                    reqLocPopUpVC.elementIndex = elementIndex
                    present(reqLocPopUpVC, animated: true, completion: nil)
                }
                else{
            labDescRef.transferToNewReq(isFromHome: false, index: elementIndex)
                }
    }
    
//    var branchDescriptionView : BranchDescription!
    var branchDescPresenter : IBranchDescPresenter!
    var branchId : String!
    var isAvailableFromHome : Bool!
    var labDescRef : IShowNewRequest!
    var elementIndex : Int!
//    var branchObj : BranchDescription!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  print("branch id \(branchId)")
    self.tabBarController?.tabBar.isHidden = true
    }
    override func willMove(toParent parent: UIViewController?) {
        if parent == nil {
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
                let destinationVC = segue.destination as! BranchTableViewController
                destinationVC.branchId = branchId
            
            

     }
     
}
