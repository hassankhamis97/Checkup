//
//  RealTime.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
import Alamofire

class RealTime {
    var ref: DatabaseReference!
    init() {
        ref = Database.database().reference()
    }
    //(email, image , name )
    func addLab(name: String, image: String, email: String) {
        
        // add lab to user firestore
        addLabToFireStore(username: name, id: Auth.auth().currentUser?.uid ?? "0x", photo: image)
        // add lab to user Auth
        Auth.auth().createUser(withEmail: email, password: "123456789Iti", completion: nil)
        
        let labObj = Laboratory(id: Auth.auth().currentUser?.uid ?? "0x", name: name, formalReferencePathId: "", specialTests: "", image: image, branches: ["",""])
        saveLabToDB(labObj: labObj)
        //        let id = ref.childByAutoId()
        //        labObj.id = id.key! as! String
        //        //            let res = try! JSONEncoder().encode(labObj)
        //        let labDic = try! DictionaryEncoder.encode(labObj)
        //        //            print(res.prettyPrintedJSONString!)
        //        ref.child("Lab").child(labObj.id!).setValue(labDic)
    }
    func addUser(id: String, email: String,birthdate: String, gender: String,phone: [Phone],insurance: String, address: Address,imagePath: String, name:String) {
        let userObj = User(id: id, name:name, email: email,  birthdate: birthdate, gender: gender, phone: phone, insurance: insurance, address: address, imagePath: imagePath)
        
        //                var id = ref.childByAutoId()
        //                userObj.id = id.key! as! String
        //            let res = try! JSONEncoder().encode(labObj)
        let userDic = try! DictionaryEncoder.encode(userObj)
        //            print(res.prettyPrintedJSONString!)
        ref.child("Users").child(userObj.id!).setValue(userDic)
    }
    func initGeneratedCode() {
        ref.child("GeneratedCode").setValue(["code": 1])
    }
    
    func addLabToFireStore(username: String, id: String, photo: String){
        Firestore.firestore().collection("users").document(id).setData([ "nickname": username, "id": id, "photoUrl": photo , "type": 4 ], merge: true)
    }
    
    func saveLabToDB(labObj: Laboratory) {
        
        let urlString = "\(ApiUrl.API_URL)/api/AnalysisService/AddNewLaboratory"
        let labDic = try! DictionaryEncoder.encode(labObj)
        //            let urlString = "http://192.168.1.9:3000/api/AnalysisService/AddNewAnalysis"
        Alamofire.request(urlString, method: .post, parameters: labDic,encoding: JSONEncoding.default, headers: nil).responseString {
            response in
            switch response.result {
            case .success:break
            case .failure(_): break
            }
        }
        
    }
}

