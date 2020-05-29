//
//  ImageIndicatorTableViewCell.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ImageIndicatorTableViewCell: UITableViewCell {

    @IBOutlet var sendIndicator: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var imageIndicator: UIActivityIndicatorView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imageIndicator.startAnimating()
        sendIndicator.layer.cornerRadius=10
        sendIndicator.layer.borderWidth=2
        sendIndicator.layer.borderColor = UIColor.white.cgColor
        // Configure the view for the selected state
    }
    
}
