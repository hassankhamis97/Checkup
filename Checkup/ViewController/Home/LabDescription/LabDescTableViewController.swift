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
    
    var labBranches : [String] = ["Alexandria branch" , "Cairo branch" , "Mansoura branch"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labBrachCollection.register(UINib(nibName: "BranchesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "brachCell")
    }


}

