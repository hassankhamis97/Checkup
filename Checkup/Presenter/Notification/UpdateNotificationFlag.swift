//
//  UpdateNotificationFlag.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class UpdateNotificationFlagPresenter: IUpdateNotificationFlagPresenter,ICheckConnection {
    func onSucessfullyConnected() {
        var manualNotificationModel = ManualNotificationModel(notificationPresenterRef : self)
        manualNotificationModel.updateNotificationFlag(testId: testId)
    }
    
    func onFailConnected() {
        
    }
    
  
    
    var updateNotificationFlagViewRef : IUpdateNotificationFlagView!
    var testId: Int64!
    init(updateNotificationFlagViewRef : IUpdateNotificationFlagView) {
        self.updateNotificationFlagViewRef = updateNotificationFlagViewRef
    }
    func updateNotificationFlag(testId: Int64) {
        self.testId = testId
        InternetConnection.checkInternetConnection(iCheckConnection: self)
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
