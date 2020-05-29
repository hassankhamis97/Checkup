//
//  SendMessage.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class SendMessagePresenter : ISendMessagePresenter {

    var messagingChatViewRef: IMessagingChatView!
    init(messagingChatViewRef: IMessagingChatView) {
        self.messagingChatViewRef = messagingChatViewRef
    }
    func saveMessage(message: Message) {
        let messagingChatModel = MessagingChatModel.getInstance()
        messagingChatModel.saveMessage(chatPresenterRef : self,message: message)
    }
    
    func onSuccess() {
        
    }
    
    func onFail(message: String) {
        
    }
    
    
}
