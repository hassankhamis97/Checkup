//
//  ChatStatus.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct ChatStatus : Codable{
    var lastMsgTimeStamp: String
    var noOfUnReadMessage: Int
    var lastMessage: String
    var senderId: String
}
