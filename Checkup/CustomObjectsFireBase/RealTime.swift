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
    func addUser(id: String, email: String,birthdate: String, gender: String,phone: [Phone],insurance: String, address: Address,imagePath: String, name:String) {
        var userObj = User(id: id, name:name, email: email,  birthdate: birthdate, gender: gender, phone: phone, insurance: insurance, address: address, imagePath: imagePath)

                var id = ref.childByAutoId()
                userObj.id = id.key! as! String
    //            let res = try! JSONEncoder().encode(labObj)
                let userDic = try! DictionaryEncoder.encode(userObj)
    //            print(res.prettyPrintedJSONString!)
                ref.child("Users").child(userObj.id!).setValue(userDic)
        }
    func initGeneratedCode() {
                ref.child("GeneratedCode").setValue(["code": 1])
        }
}

