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
//    backgroundColor = .clear
//
//
//      let blurEffect = UIBlurEffect(style: .regular)
//      let blurView = UIVisualEffectView(effect: blurEffect)
//      blurView.translatesAutoresizingMaskIntoConstraints = false
//      insertSubview(blurView, at: 0)
//        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//           self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//           self.layer.shadowOpacity = 1.0
//           self.layer.shadowRadius = 0.0
//           self.layer.masksToBounds = false
////           self.layer.cornerRadius = 4.0
//        self.tintColor = .clear
//      NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: heightAnchor) , blurView.widthAnchor.constraint(equalTo:widthAnchor)])
//
//        layer.shadowPath =  UIBezierPath(rect: self.bounds).cgPath
//layer.shadowRadius = 14
// layer.shadowOffset = .zero
// layer.shadowOpacity = 0.5
// layer.cornerRadius = 5
// layer.borderWidth = 5
// layer.borderColor = UIColor.white.cgColor
 }


    
}
