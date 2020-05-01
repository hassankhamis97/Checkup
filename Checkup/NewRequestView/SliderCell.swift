//
//  SliderCell.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
  
    
    @IBOutlet weak var testImage: UIImageView!
    var image:UIImage!{
        didSet{
            testImage.image=image
            testImage.layer.borderWidth=3
        }
    }
    

    
}
