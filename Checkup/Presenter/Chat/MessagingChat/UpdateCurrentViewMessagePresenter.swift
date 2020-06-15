//
//  UpdateCurrentViewMessagePresenter.swift
//  Checkup
//
//  Created by Hassan Khamis on 6/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class UpdateCurrentViewMessagePresenter : IUpdateCurrentViewMessagePresenter {
    func updateCurrentView(pearedId: String, isEntered: Bool) {
        let messagingChatModel = MessagingChatModel.getInstance()
        messagingChatModel.updateCurrentView(pearedId: pearedId, isEntered: isEntered)
    }
    
//    var updateCurrentViewMessageViewRef: IUpdateCurrentViewMessageView!
//    init(updateCurrentViewMessageViewRef: IUpdateCurrentViewMessageView) {
//        self.updateCurrentViewMessageViewRef = updateCurrentViewMessageViewRef
//    }
//    func saveMessage(imageMessage: ImageMessage) {
//        let messagingChatModel = MessagingChatModel.getInstance()
//        messagingChatModel.saveMessage(chatPresenterRef : self,imageMessage: imageMessage)
//    }
    
    func onSuccess() {
//        updateCurrentViewMessageViewRef.renderViewImageMessage()
    }
    
    func onFail(message: String) {
        
    }
    
}
