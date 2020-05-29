//
//  SenderImageTableViewCell.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import  ImageSlideshow

class SenderImageTableViewCell: UITableViewCell {

    @IBOutlet var sentImage: UIImageView!
//    @IBOutlet weak var slideShow: ImageSlideshow!

    @IBOutlet var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        sentImage.layer.cornerRadius=10
                sentImage.layer.borderWidth=2
        //        myLabel.textContainerInset = UIEdgeInsetsMake(10, 0, 10, 0);
                
                if #available(iOS 13.0, *) {
                    sentImage.layer.borderColor = CGColor.init(srgbRed: 58, green: 61, blue: 107, alpha: 255)
                } else {
                    // Fallback on earlier versions
                }
        // Configure the view for the selected state
    }
//    @objc func didTap() {
//        let fullScreenController = slideShow.presentFullScreenController(from: self)
//        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
//        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
//    }
}
