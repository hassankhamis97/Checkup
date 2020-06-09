//
//  Lab.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
struct Laboratory : Encodable {
    var id : String?
    var name : String?
    var formalReferencePathId : String?
    var specialTests : String?
    var image : String?
    var branches : [String]?
    var FireBaseId : String?
    var hotline : String?
    var rating : Double?
//    func toDictionary() -> Any {     return ["id": id, "name": name, "formalReferencePathId": formalReferencePathId, "specialTests": specialTests, "image": image, "branches": branches] as Any }
}

