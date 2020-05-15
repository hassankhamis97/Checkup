//
//  RealTime.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
class RealTime {
    var ref: DatabaseReference!
    init() {
        ref = Database.database().reference()
    }
    func addLab(name: String, image: String) {
         var labObj = Laboratory(id: "", name: name, formalReferencePathId: "", specialTests: "", image: image, branches: ["",""])

            var id = ref.childByAutoId()
            labObj.id = id.key! as! String
//            let res = try! JSONEncoder().encode(labObj)
            let labDic = try! DictionaryEncoder.encode(labObj)
//            print(res.prettyPrintedJSONString!)
            ref.child("Lab").child(labObj.id!).setValue(labDic)
    }
    func addLab(name: String, image: String) {
             var labObj = Laboratory(id: "", name: name, formalReferencePathId: "", specialTests: "", image: image, branches: ["",""])

                var id = ref.childByAutoId()
                labObj.id = id.key! as! String
    //            let res = try! JSONEncoder().encode(labObj)
                let labDic = try! DictionaryEncoder.encode(labObj)
    //            print(res.prettyPrintedJSONString!)
                ref.child("Lab").child(labObj.id!).setValue(labDic)
        }
    
}
struct DictionaryEncoder {
    static func encode<T>(_ value: T) throws -> [String: Any] where T: Encodable {
        let jsonData = try JSONEncoder().encode(value)
        return try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] ?? [:]
    }
}
