//
//  User.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

struct User : Encodable{
    var id: String?
    var name:String?
    var email: String?
    var birthdate: String?
    var gender: String?
    var phone: [Phone]?
    var insurance: String?
    var address: Address?
    var imagePath: String?
    
}
