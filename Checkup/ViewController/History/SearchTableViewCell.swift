//
//  SearchTableViewCell.swift
//  Checkup
//
//  Created by Aya on 5/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var labImage: UIImageView!
    @IBOutlet weak var labNameOutlet: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
