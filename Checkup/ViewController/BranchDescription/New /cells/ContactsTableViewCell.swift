//
//  ContactsTableViewCell.swift
//  Checkup
//
//  Created by Aya on 6/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    @IBOutlet weak var phoneTypeImage: UIImageView!
    @IBOutlet weak var phoneNumberTxt: UILabel!
    @IBOutlet weak var callBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
/*
 import UIKit

 class ContactTableViewCell: UITableViewCell {

     @IBOutlet weak var phoneTypeImage: UIImageView!
     @IBOutlet weak var phoneNumberTxt: UILabel!

     @IBOutlet weak var callBtn: UIButton!
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }

     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         // Configure the view for the selected state
     }

 }

 */
