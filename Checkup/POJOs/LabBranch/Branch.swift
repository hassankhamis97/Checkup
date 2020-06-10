//
//  Branch.swift
//  Checkup
//
//  Created by Hassan Khamis on 6/9/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct Branch : Codable{
    var name: String
    var email : String
    var password : String
    var image : String
    var phone : String
    var isAvailableFromHome : Bool
    var timeFrom : String
    var timeTo : String
    var holidays : String
    var FireBaseId : String
    var LabId : Int64
    var address : Address
    var rating : Double
    var governId : Int64
}
