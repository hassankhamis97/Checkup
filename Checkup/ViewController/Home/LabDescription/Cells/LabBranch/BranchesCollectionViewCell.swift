//
//  BranchesCollectionViewCell.swift
//  Checkup
//
//  Created by Aya on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Cosmos
class BranchesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var distanceOutlet: UILabel!
    @IBOutlet weak var branchDescOutlet: UILabel!
    @IBOutlet weak var governNameOutlet: UILabel!
    @IBOutlet weak var ratingOutlet: CosmosView!
    @IBOutlet var addressOutlet: UILabel!
    
    @IBOutlet weak var requestBtnOutlet: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   //    branchDescOutlet.sizeToFit()
        requestBtnOutlet.layer.cornerRadius = 6
        requestBtnOutlet.layer.borderWidth = 2
        requestBtnOutlet.layer.borderColor = UIColor.white.cgColor
    
 
 
 }


    
}
