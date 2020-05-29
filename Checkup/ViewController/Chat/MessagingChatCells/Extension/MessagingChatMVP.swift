//
//  MessagingChatMVP.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension MessagingChatViewController : IMessagingChatView , IImageMessageView , ISendMessageView {
    func renderViewSendMessage() {
        
    }
    

    
    func renderViewImageMessage() {
        isSendImage = false
        self.messages.remove(at: 0)
        msgTableView.reloadData()
    }
    
    func dataInView(allMessages : AllMessages,isFirebaseCall: Bool) {
        if (messageParams.skip != nil && isFirebaseCall == false){
            for item in allMessages.messages!{
                self.messages.append(item)
            }
        }
        else{
            self.messages = allMessages.messages!
        }
        if allMessages.lastMessageSnapshot != nil {
            messageParams.skip = allMessages.lastMessageSnapshot
        }
        msgTableView.reloadData()
    }
}
