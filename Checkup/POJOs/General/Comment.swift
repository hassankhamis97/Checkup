//
//  Comment.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct Comment {
    var id: String?
    var comment: String?
    var userId: String??
    func toDictionary() -> Any {     return ["id": id, "comment": comment, "userId": userId] as Any }
}
