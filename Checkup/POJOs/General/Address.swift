//
//  Address.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

struct Address : Encodable{
    var address: String? // do you mean full street name and Govern !!
    var buildingNo: String?
    var floorNo: String?
    var apartmentNo: String?
    var longitude: String?
    var latitude: String?
}
