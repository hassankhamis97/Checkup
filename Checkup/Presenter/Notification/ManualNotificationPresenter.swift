//
//  ManualNotification.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class ManualNotificationPresenter: IManualNotificationPresenter ,ICheckConnection {
    
    
    var manualNotificationViewRef : IManualNotificationView!
    init(manualNotificationViewRef : IManualNotificationView) {
        self.manualNotificationViewRef = manualNotificationViewRef
    }
    func getNotificationNumbers() {
        InternetConnection.checkInternetConnection(iCheckConnection: self)
    }
    
    func onSuccess(manualNotification: ManualNotification) {
        manualNotificationViewRef.renderView(manualNotification: manualNotification)
    }
    
    func onFail(errorMsg: String) {
        
    }
    func onSucessfullyConnected() {
        var manualNotificationModel = ManualNotificationModel(notificationPresenterRef : self)
        manualNotificationModel.getNotificationNumbers()
    }
    
    func onFailConnected() {
        
    }
    
}
