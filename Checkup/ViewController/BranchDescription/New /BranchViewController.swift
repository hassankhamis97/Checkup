//
//  BranchViewController.swift
//  Checkup
//
//  Created by Aya on 6/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class BranchViewController: UIViewController{
  
    
    var branchDescriptionView : BranchDescription!
    var branchDescPresenter : IBranchDescPresenter!
    var branchId : String!
    var branchObj : BranchDescription!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  print("branch id \(branchId)")
    
    }
   
    
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
                let destinationVC = segue.destination as! BranchTableViewController
                destinationVC.branchId = branchId
            
            

     }
     
}
