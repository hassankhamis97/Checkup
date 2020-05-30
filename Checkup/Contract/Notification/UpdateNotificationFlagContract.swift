//
//  UpdateNotificationFlagContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IUpdateNotificationFlagView{
//    func renderView()
}


protocol IUpdateNotificationFlagPresenter : INotificationPresenter{
    func updateNotificationFlag(testId: Int64)
//    func onSuccess(manualNotification: ManualNotification)
//    func onFail(errorMsg: String)
}


//protocol IUpdateNotificationFlagModel{
//    func getNotificationNumbers()
//}
