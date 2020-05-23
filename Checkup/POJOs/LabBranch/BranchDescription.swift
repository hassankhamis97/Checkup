//
//  BranchDescription.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct BranchDescription : Codable{
    var labId : String?
    var branchId : String?
    var labName : String?
    var labPhoto : String?
    var govern : String?
    var address : Address?
    var phone : String?
//    var phone : [Phone]?
    var holidays : [String]?
    var timeFrom : String?
    var timeTo : String?
    var isAvailableFromHome : Bool
    var review : Review?
//    func toDictionary() -> Any {     return ["id": id, "email": email, "password": password, "govern": govern, "image": image, "phone": phone.toDictionary(),"isAvailableFromHome": isAvailableFromHome, "timeFrom": timeFrom, "timeTo": timeTo, "holidays": holidays, "longitude": longitude, "latitude": latitude,"review": review.toDictionary() ] as Any }
}
