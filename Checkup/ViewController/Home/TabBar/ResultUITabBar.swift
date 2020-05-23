//
//  ResultUITabBar.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ResultUITabBar: UITabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == (self.tabBar.items as! [UITabBarItem])[1]{
            let requsestSV = self.tabBarController
           //Do something if index is 0
        }
        else if item == (self.tabBar.items as! [UITabBarItem])[3]{
           //Do something if index is 1
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
