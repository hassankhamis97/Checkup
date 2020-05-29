//
//  MessagingChat.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
protocol IMessagingChatView {
    func dataInView(allMessages : AllMessages, isFirebaseCall: Bool)
}

protocol IMessagingChatPresenter : IChat {
    func getData(messageParams: MessageParams)
//    func getData(messageParams: MessageParams, skip : inout QueryDocumentSnapshot)
    func onSuccess(allMessages : AllMessages, isFirebaseCall: Bool)
    func onFail(message: String)
}


