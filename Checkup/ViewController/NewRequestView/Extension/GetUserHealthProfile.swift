//
//  GetUserHealthProfile.swift
//  Checkup
//
//  Created by Hassan Khamis on 6/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension NewRequestTableViewController: IHealthProfileView
{
    func renderUpdatedHealthProfileView() {
        
    }
    func renderHealthProfileView(healthProfile: HealthProfile) {
        self.healthProfile=healthProfile
        
    }
    
}
