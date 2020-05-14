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
    
    var labBranches : [String] = ["Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labBrachCollection.register(UINib(nibName: "BranchesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "branchCell")
            //let layout = UICollectionViewFlowLayout()
      //  layout.sectionInset = UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0)

    //    layout.minimumLineSpacing = 0.0
      //  layout.minimumInteritemSpacing = 0.0
       //self.labBrachCollection?.collectionViewLayout = layout
    }


}

