//
//  ImageMessagePresenter.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class ImageMessagePresenter : IImageMessagePresenter {
    

    var messagingChatViewRef: IImageMessageView!
    init(messagingChatViewRef: IImageMessageView) {
        self.messagingChatViewRef = messagingChatViewRef
    }
    func saveMessage(imageMessage: ImageMessage) {
        let messagingChatModel = MessagingChatModel.getInstance()
        messagingChatModel.saveMessage(chatPresenterRef : self,imageMessage: imageMessage)
    }
    
    func onSuccess() {
        messagingChatViewRef.renderViewImageMessage()
    }
    
    func onFail(message: String) {
        
    }
    
    
}
