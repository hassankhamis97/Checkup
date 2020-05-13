//
//  DateTableViewCell.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: MessageLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    dateLabel.layer.cornerRadius = 15.0
            dateLabel.layer.borderWidth = 2.0
    //        msgTextField.layer.borderColor = UIColor.red.cgColor
    //        msgTextField.layer.borderColor = UIColor.
            dateLabel.layer.borderColor = UIColor(red: 226, green: 242, blue: 252, alpha: 1.0).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
