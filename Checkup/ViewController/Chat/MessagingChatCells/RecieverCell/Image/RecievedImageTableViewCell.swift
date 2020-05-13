//
//  RecievedImageTableViewCell.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class RecievedImageTableViewCell: UITableViewCell {
    @IBOutlet var recievedPersonImage: UIImageView!

    @IBOutlet var recievedImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        recievedPersonImage.layer.cornerRadius=recievedPersonImage.frame.width / 2
        recievedImg.layer.cornerRadius=10
        recievedImg.layer.borderWidth=2
        if #available(iOS 13.0, *) {
            recievedImg.layer.borderColor = CGColor.init(srgbRed: 58, green: 61, blue: 107, alpha: 255)
        } else {
            // Fallback on earlier versions
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
