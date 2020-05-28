//
//  ChatContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IChat {
    
}
protocol IMessagingChatModel {
    func getData(chatPresenterRef : IChat,messageParams: MessageParams)
    func saveMessage(chatPresenterRef : IChat,message: Message)
}
