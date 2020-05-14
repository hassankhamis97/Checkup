//
//  BranchesCollectionViewCell.swift
//  Checkup
//
//  Created by Aya on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class BranchesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var branchDescOutlet: UILabel!
    
    @IBOutlet weak var requestBtnOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   //    branchDescOutlet.sizeToFit()
        requestBtnOutlet.layer.cornerRadius = 15
        requestBtnOutlet.layer.borderWidth = 2
        requestBtnOutlet.layer.borderColor = UIColor.white.cgColor
    }

}
