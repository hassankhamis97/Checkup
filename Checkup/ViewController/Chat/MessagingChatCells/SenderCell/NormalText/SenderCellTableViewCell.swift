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

    @IBOutlet var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myLabel.layer.cornerRadius=10
        myLabel.layer.borderWidth=2
//        myLabel.textContainerInset = UIEdgeInsetsMake(10, 0, 10, 0);
        
        if #available(iOS 13.0, *) {
            myLabel.layer.borderColor = CGColor.init(srgbRed: 58, green: 61, blue: 107, alpha: 255)
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
