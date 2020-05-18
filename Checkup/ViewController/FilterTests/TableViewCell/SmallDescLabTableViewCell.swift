//
//  SmallDescLabTableViewCell.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class SmallDescLabTableViewCell: UITableViewCell {
    @IBOutlet var checkedIcon: UIButton!
    
    @IBOutlet var labName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
