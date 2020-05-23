//
//  HomeLabRealm.swift
//  Checkup
//
//  Created by azab on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import RealmSwift

class HomeLabRealm:  Object{
    @objc dynamic var idFB = ""
    @objc dynamic var hotline = ""
    @objc dynamic var labPhoto = ""
    @objc dynamic var labName = ""
    @objc dynamic var rating = ""
    
    override static func primaryKey() -> String? {
        return "idFB"
    }  
}
