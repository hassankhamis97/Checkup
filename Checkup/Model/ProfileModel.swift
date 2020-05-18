//
//  ProfileModel.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase

class ProfileModel{
    
    var phoNArray=[Phone]()
    var profilePresenterRef:IProfilePresenter!
    init(profilePresenterRef:IProfilePresenter) {
        
        self.profilePresenterRef=profilePresenterRef
    }
    
    
    
    func getUser(userId:String) {
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("Users").child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            let name = value?["name"] as? String ?? ""
            let email = value?["email"] as? String ?? ""
            
            let birthdate = value?["birthdate"] as? String ?? ""
            let gender = value?["gender"] as? String ?? ""
            
            let insurance = value?["insurance"] as? String ?? ""
            let imagePath = value?["imagePath"] as? String
                ?? ""
            let addressMain = value?["address"] as? NSDictionary
            
            let address = addressMain?["address"] as? String
                ?? ""
            let apartmentNo = addressMain?["apartmentNo"] as? String
                ?? ""
            let buildingNo = addressMain?["buildingNo"] as? String
                ?? ""
            let floorNo = addressMain?["floorNo"] as? String
                ?? ""
            let latitude = addressMain?["latitude"] as? String
                ?? ""
            let longitude = addressMain?["longitude"] as? String
                ?? ""
            
            let adressObj=Address(address: address, buildingNo: buildingNo, floorNo: floorNo, apartmentNo: apartmentNo, longitude: longitude, latitude: latitude)
            let phone = value?["phone"] as? NSArray
            
            
            if (phone != nil)
            {
                for obj in phone!{
                    let dict = obj as! NSDictionary
                    let isLand =  dict.value(forKey: "isLand") as! Bool
                    let number =  dict.value(forKey: "number") as! String
                    
                    var ph=Phone()
                    ph.isLand=isLand
                    ph.number=number
                    
                    self.phoNArray.append(ph)
                }
                
                
            }
            
            
            var user=User(id: userId, name: name, email: email, birthdate: birthdate, gender: gender, phone: self.phoNArray, insurance: insurance, address:adressObj , imagePath: imagePath)
            
            
            
            self.profilePresenterRef.onSuccess(user: user)
            
            
            
        })
            
        { (error) in
            print(error.localizedDescription)
            
            self.profilePresenterRef.onFail(message: "No Internte Connection")
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}









