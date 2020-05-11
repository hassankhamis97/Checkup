//
//  SenderCellTableViewCell.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class SenderCellTableViewCell: UITableViewCell {
    @IBOutlet var myLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myLabel.layer.cornerRadius=10
        myLabel.layer.borderWidth=2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
