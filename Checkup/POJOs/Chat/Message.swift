//
//  Message.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
struct Message : Codable {
    var content: String?
    var idFrom: String?
    var idTo: String?
    var timestamp: String?
    var type: Int?
}
