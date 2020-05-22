//
//  TestFilter.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct TestFilter : Encodable{
    var isFilter: Bool?
    var dateFrom: String?
    var dateTo: String?
    var labIds: [String]?
    var userId: String?
    var status: [String]?
    var take: Int?
    var skip: Int?
}
