//
//  mainReviewsTableViewCell.swift
//  Checkup
//
//  Created by Aya on 5/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Cosmos
class mainReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionOutlet: UILabel!
    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var ratingOutlet: CosmosView!
    @IBOutlet weak var userNameOutlet: UILabel!
    @IBOutlet weak var reviewsDateOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
