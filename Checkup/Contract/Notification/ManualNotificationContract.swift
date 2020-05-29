//
//  ManualNotificationContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IManualNotificationView{
    func renderView(manualNotification: ManualNotification)
}


protocol IManualNotificationPresenter : INotificationPresenter{
    func getNotificationNumbers()
    func onSuccess(manualNotification: ManualNotification)
    func onFail(errorMsg: String)
}


