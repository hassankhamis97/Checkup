//
//  AllMessages.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
struct AllMessages {
    var messages: [Message]?
    var lastMessageSnapshot: QueryDocumentSnapshot?
}
