//
//  RecieverCellTableViewCell.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class RecieverCellTableViewCell: UITableViewCell {
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var recievedPersonImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        recievedPersonImage.layer.cornerRadius=recievedPersonImage.frame.width / 2
        recieverLabel.layer.cornerRadius=10
        recieverLabel.layer.borderWidth=2
        if #available(iOS 13.0, *) {
            recieverLabel.layer.borderColor = CGColor.init(srgbRed: 58, green: 61, blue: 107, alpha: 255)
        } else {
            // Fallback on earlier versions
        }
//        layer.borderColor=Uicolor.white.cgcolor
    }

    @IBOutlet var recieverLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
