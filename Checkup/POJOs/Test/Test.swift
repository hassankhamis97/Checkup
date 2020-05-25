//
//  Test.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct Test : Codable{
    var id : Int64?
    var userId: String?
    var testName: [String]?
    var resultFilespaths: [String]?
    var roushettaPaths: [String]?
    var description: String?
    var isFromHome: Bool?
    var dateRequest: String?
    var timeRequest: String?
    var dateForTakingSample: String?
    var timeForTakingSample: String?
    var dateResult: String?
    var timeResult: String?
    var branchId: String?
    var labId: String?
    var address: Address?
    var hba1c: String?
    var status: String?
    var isNotified: Bool?
    var totalCost: String?
    var precautions: String?
    var employeeId: String?
    var radioReason: String?
    var refuseReason: String?
    var generatedCode: String?
//    var dateRequestFormat: Date?
    
}
