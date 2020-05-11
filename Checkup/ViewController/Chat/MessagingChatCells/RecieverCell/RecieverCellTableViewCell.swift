//
//  RecieverCellTableViewCell.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class RecieverCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius=10
        layer.borderWidth=2
//        layer.borderColor=Uicolor.white.cgcolor
    }

    @IBOutlet var recieverLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
