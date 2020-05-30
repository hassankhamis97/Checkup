//
//  Request.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct Request : Codable {
    var id : Int64?
    var dateRequest: String?
    var status: String?
    var labName: String?
    var labPhoto: String?
    var isNotified: Bool?
}
