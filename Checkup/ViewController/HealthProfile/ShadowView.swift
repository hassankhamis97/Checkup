//
//  ShadowView.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/3/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ShadowView: UIView {

  
    override func awakeFromNib() {
        super.awakeFromNib()

        setup()
       
    }

    private func setup() {
    self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
           self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
           self.layer.shadowOpacity = 1.0
           self.layer.shadowRadius = 0.0
           self.layer.masksToBounds = false
           self.layer.cornerRadius = 4.0
        self.tintColor = .clear
        
    }

}
