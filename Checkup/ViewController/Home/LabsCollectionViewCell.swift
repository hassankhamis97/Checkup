//
//  LabsCollectionViewCell.swift
//  Checkup
//
//  Created by Aya on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Cosmos
class LabsCollectionViewCell: UICollectionViewCell {
    
    @IBAction func reqBtn(_ sender: UIButton) {
        sender.pulsate()
    }
    @IBOutlet weak var labImageVIew: UIImageView!
    @IBOutlet weak var labRating: CosmosView!
}
