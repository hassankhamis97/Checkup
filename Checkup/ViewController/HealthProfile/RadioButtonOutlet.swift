//
//  RadioButtonOutlet.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/3/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class RadioButtonOutlet: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setup()
       
    }

    private func setup() {
        layer.cornerRadius = self.frame.width/2
        layer.borderWidth=1
        layer.borderColor=UIColor.systemTeal.cgColor
        self.tintColor = .clear
        
    }


}

