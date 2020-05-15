//
//  LabDescTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class LabDescTableViewController: UITableViewController {
    @IBOutlet weak var labBrachCollection: UICollectionView!
   // let interItemSpacing : CGFloat! = 0.0
    var labBranches : [String] = ["Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labBrachCollection.register(UINib(nibName: "BranchesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "branchCell")
            let layout = UICollectionViewFlowLayout()
      
        let screenSIze = UIScreen.main.bounds
        let width = screenSIze.width
        let height = screenSIze.height-200
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
     //   layout.itemSize = CGSize(width: width/2 , height: height/2)
           //layout.itemSize = CGSize(width: 200/2, height: 200/2)
        layout.itemSize = CGSize(width: 191, height: 213)
       layout.minimumInteritemSpacing = 1.0
       self.labBrachCollection?.collectionViewLayout = layout
    
        
  
        //self.labBrachCollection.bounds.
        
    }


}

