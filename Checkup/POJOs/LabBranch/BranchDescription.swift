//
//  BranchDescription.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct BranchDescription {
    var id : String?
    var email : String?
    var govern : String?
    var address : Address?
    var image : String?
    var phone : [Phone]?
    var isAvailableFromHome : Bool
    var timeFrom : String?
    var timeTo : String?
    var holidays : [String]?
    var longitude : Double?
    var latitude : Double?
    var review : [Review]?
//    func toDictionary() -> Any {     return ["id": id, "email": email, "password": password, "govern": govern, "image": image, "phone": phone.toDictionary(),"isAvailableFromHome": isAvailableFromHome, "timeFrom": timeFrom, "timeTo": timeTo, "holidays": holidays, "longitude": longitude, "latitude": latitude,"review": review.toDictionary() ] as Any }
}
