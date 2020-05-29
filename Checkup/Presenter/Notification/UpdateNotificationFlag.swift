//
//  UpdateNotificationFlag.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class UpdateNotificationFlagPresenter: IUpdateNotificationFlagPresenter {
  
    
    var updateNotificationFlagViewRef : IUpdateNotificationFlagView!
    init(updateNotificationFlagViewRef : IUpdateNotificationFlagView) {
        self.updateNotificationFlagViewRef = updateNotificationFlagViewRef
    }
    func updateNotificationFlag(testId: Int64) {
          var manualNotificationModel = ManualNotificationModel(notificationPresenterRef : self)
          manualNotificationModel.updateNotificationFlag(testId: testId)

      }
//    func getNotificationNumbers() {
//        var manualNotificationModel = ManualNotificationModel(manualNotificationPresenterRef : self)
//        manualNotificationModel.getNotificationNumbers()
//    }
//
//    func onSuccess(manualNotification: ManualNotification) {
//        manualNotificationViewRef.renderView(manualNotification: manualNotification)
//    }
//
//    func onFail(errorMsg: String) {
//
//    }
    
    
}
