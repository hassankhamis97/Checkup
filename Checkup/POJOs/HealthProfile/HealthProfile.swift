//
//  HealthProfile.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/3/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

struct HealthProfile:Codable  {
    var userId:String?
    var  isSuffreDiabetes:Bool?
    var  isSuffrePressure:Bool?
    var  isSTakeantiBiotic:Bool?
    var  isTakehaemophilia:Bool?
    var  dieaseNamesArray:[String]?
    
}
