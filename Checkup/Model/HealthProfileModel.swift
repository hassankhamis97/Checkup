//
//  HealthProfileModel.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire


class HealthProfileModel:IHealthProfileModel{
   
    
    
    var healthProfilePresenterRef:IHealthProfilePresenter!
      init(healthProfilePresenterRef:IHealthProfilePresenter) {
          
          self.healthProfilePresenterRef=healthProfilePresenterRef
      }
    
    
    func getHealthProfileData(userId: String) {
        
        
        
        let obj=HealthProfile(userId: "", isSuffreDiabetes: true, isSuffrePressure: false, isSTakeantiBiotic: true, isTakehaemophilia: false, dieaseNamesArray: ["cbc","tsh"])
        
        
        
        
//        Alamofire.request("http://checkup.somee.com/api/AnalysisService/GetHbA1cSampleStatistics?userId="+userId).responseJSON { (response) in
//            if let JSON = response.result.value{
//                print(JSON)
//
//                do{
//                    let Obj = try JSONDecoder().decode(HealthProfile.self , from: response.data!)
//
//                    print(Obj)
//
//                    self.healthProfilePresenterRef.onSuccess(healthProfile: obj)
//                }catch let error{
//                    self.healthProfilePresenterRef.onFail(message: error.localizedDescription)
//
//                    print(error)
//                }
//            }
//
//
//        }
        
        
        
        healthProfilePresenterRef.onSuccess(healthProfile: obj)
        
    }
    
    
    
    func updateUserData(userId: String, healthProfileObj: HealthProfile) {
        
           
       }
    
    
    
}
