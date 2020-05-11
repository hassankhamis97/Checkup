//
//  UIButtonExtension.swift
//  Checkup
//
//  Created by Aya on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func pulsate(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6        //0.6
        pulse.fromValue = 0.95      //0.95
        pulse.toValue = 1.0         //1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1       //2
        pulse.initialVelocity = 1   //0.5
        pulse.damping = 1.0           //1.0
        layer.add(pulse, forKey: nil)
    }
    
    
}
