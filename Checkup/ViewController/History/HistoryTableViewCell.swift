//
//  HistoryTableViewCell.swift
//  Checkup
//
//  Created by Aya on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var labImageOutlet: UIImageView!
    
    @IBOutlet weak var labNameOutlet: UITextView!
    
    @IBOutlet weak var labDateOutlet: UITextView!
    
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
/*
 
 
 */