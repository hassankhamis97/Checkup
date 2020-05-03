//
//  SliderCell.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
  
  
    @IBOutlet weak var testCell: UILabel!
    var label:UILabel!{
        didSet{
            testCell.text=label.text
        
         
            
            
        }
    }
    

    
}
