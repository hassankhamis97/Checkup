//
//  MainChatTableViewCell.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class MainChatTableViewCell: UITableViewCell {

    @IBOutlet var pearedUserImg: UIImageView!
    @IBOutlet var pearedUserName: UILabel!
    @IBOutlet var lastMessage: UILabel!
    @IBOutlet var lastMessageTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        pearedUserImg.layer.cornerRadius=pearedUserImg.frame.width / 2

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
