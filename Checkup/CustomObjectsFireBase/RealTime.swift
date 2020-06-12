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
    func addLab(name: String, image: String, email: String,hotLine:String,rating:Double) {
        
        Auth.auth().createUser(withEmail: email, password: "123456789Iti"){ authResult, error in
            if authResult != nil {
                
                // add lab to user firestore
                self.addLabToFireStore(username: name, id: authResult?.user.uid ?? "0x", photo: image)
                
                // add lab to user Auth
//                let labObj = Laboratory(id: authResult?.user.uid ?? "0x", name: name, formalReferencePathId: "", specialTests: "", image: image, branches: ["",""])
                let labObj = Laboratory(id: "", name: name, formalReferencePathId: "", specialTests: "", image: image, branches: [""], FireBaseId: authResult?.user.uid ?? "0x", hotline: hotLine, rating: rating)
                self.saveLabToDB(labObj: labObj)
            }
        }
        
        //        let id = ref.childByAutoId()
        //        labObj.id = id.key! as! String
        //        //            let res = try! JSONEncoder().encode(labObj)
        //        let labDic = try! DictionaryEncoder.encode(labObj)
        //        //            print(res.prettyPrintedJSONString!)
        //        ref.child("Lab").child(labObj.id!).setValue(labDic)
    }
    
    
    // Auth - fireStore type 3 - API
    //(email, image, phone, isFromHome: Bool, time to&from, holiday, labId, address, rating, GovernId)
    func addBranch(name: String, email: String, labId: Int64, image: String, phone: String, isFromHome: Bool, timeFrom: String, timeTo: String, holidays : String, address: Address, rating: Double, governId: Int64){
        
        Auth.auth().createUser(withEmail: email, password: "123456789Iti"){ authResult, error in
            if authResult != nil {
                
                // add lab to user firestore
                self.addLabBranchToFireStore(username: name, id: authResult?.user.uid ?? "0x", photo: image)
                
                // add lab to user Auth
                let labBranchObj = Branch(name: name, email: email, password: "123456789Iti", image: image, phone: phone, isAvailableFromHome: isFromHome, timeFrom: timeFrom, timeTo: timeTo, holidays: holidays, FireBaseId: authResult?.user.uid ?? "0x", LabId: labId, address: address, rating: rating, governId: governId)
                self.saveLabBranchToDB(labBranchObj: labBranchObj)
            }
        }
        
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
    
    func addLabBranchToFireStore(username: String, id: String, photo: String){
          Firestore.firestore().collection("users").document(id).setData([ "nickname": username, "id": id, "photoUrl": photo , "type": 3 ], merge: true)
      }
    
    func saveLabToDB(labObj: Laboratory) {
        
        let urlString = "\(ApiUrl.API_URL)/api/Lab/addLab"
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
    
    func saveLabBranchToDB(labBranchObj: Branch) {
        
        let urlString = "\(ApiUrl.API_URL)/api/Lab/addLabBranch"
        let labDic = try! DictionaryEncoder.encode(labBranchObj)
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

