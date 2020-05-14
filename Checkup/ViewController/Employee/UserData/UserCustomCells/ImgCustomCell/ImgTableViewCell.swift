//
//  ImgTableViewCell.swift
//  Checkup
//
//  Created by azab on 5/14/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ImgTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var patientImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        patientImg.layer.cornerRadius = patientImg.frame.width / 2
    }
    
}
