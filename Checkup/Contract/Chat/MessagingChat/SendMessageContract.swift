//
//  SendMessageContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol ISendMessageView {
    func renderViewSendMessage()
}

protocol ISendMessagePresenter : IChat{
    func saveMessage(message: Message)
//    func getData(messageParams: MessageParams, skip : inout QueryDocumentSnapshot)
    func onSuccess()
    func onFail(message: String)
}

//protocol IMessagingChatModel {
//    func getData(messageParams: MessageParams)
//}