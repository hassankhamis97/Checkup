//
//  Phone.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct Phone {
    var id: String?
    var number: String?
    var isLand: Bool?
    func toDictionary() -> Any {     return ["id": id, "number": number, "isLand": isLand] as Any }
}
