//
//  HistoryTableViewCell.swift
//  Checkup
//
//  Created by Aya on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var colorViewOutlet: UIView!
    //    @IBOutlet weak var colorViewOutlet: UILabel!
    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var labImageOutlet: UIImageView!
    @IBOutlet weak var labDateOutlet: UILabel!
    @IBOutlet weak var labNameOutlet: UILabel!
    
    @IBOutlet var requestStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        colorViewOutlet.layer.cornerRadius = colorViewOutlet.frame.width / 2
//        colorViewOutlet
//        colorViewOutlet.addGradientBackground(firstColor: #colorLiteral(red: 0.9882352941, green: 0.6392156863, blue: 0.6352941176, alpha: 1), secondColor: #colorLiteral(red: 0.8156862745, green: 0, blue: 0.09411764706, alpha: 1))
//        colorViewOutlet.layer.borderWidth = 0.5
//
//        colorViewOutlet.layer.borderColor = #colorLiteral(red: 0.6705882353, green: 0, blue: 0.0862745098, alpha: 1)
    }

}
/*
 
 
 */
