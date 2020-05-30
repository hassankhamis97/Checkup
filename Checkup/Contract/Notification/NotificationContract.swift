//
//  NotificationContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol INotificationPresenter {
    
}

protocol IManualNotificationModel{
    func getNotificationNumbers()
    func updateNotificationFlag(testId: Int64)
}
