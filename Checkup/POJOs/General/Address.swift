//
//  Address.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

struct Address :Codable{
    var address1: String? // do you mean full street name and Govern !!
    var buildingNo: String?
    var floorNo: String?
    var apartmentNo: String?
    var longitude: Double?
    var latitude: Double?
}
