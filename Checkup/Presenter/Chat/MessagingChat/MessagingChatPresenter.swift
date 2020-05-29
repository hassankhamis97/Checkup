//
//  MessagingChatPresenter.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
class MessagingChatPresenter: IMessagingChatPresenter {
    var messagingChatViewRef: IMessagingChatView!
    init(messagingChatViewRef: IMessagingChatView) {
        self.messagingChatViewRef = messagingChatViewRef
    }
    func getData(messageParams: MessageParams) {
        let messagingChatModel = MessagingChatModel.getInstance()
        messagingChatModel.getData(chatPresenterRef : self,messageParams: messageParams)
    }
//    func saveMessage(message : Message) {
//        let messagingChatModel = MessagingChatModel(chatPresenterRef: self)
//        messagingChatModel.saveMessage(message : message)
//    }
    func onSuccess(allMessages: AllMessages, isFirebaseCall: Bool) {
        messagingChatViewRef.dataInView(allMessages: allMessages,isFirebaseCall: isFirebaseCall)
    }
    
    func onFail(message: String) {
        
    }
    
     
}
