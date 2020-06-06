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
        
        
        
//        let obj=HealthProfile(userId: "", isSuffreDiabetes: true, isSuffrePressure: false, isSTakeantiBiotic: true, isTakehaemophilia: false, dieaseNamesArray: ["cbc","tsh"])
        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/RetrieveHealthProfile?userId="+userId).responseJSON { (response) in
            if let JSON = response.result.value{
                print(JSON)

                do{
                    let obj = try JSONDecoder().decode(HealthProfile.self , from: response.data!)

                    print(obj)

                    self.healthProfilePresenterRef.onSuccess(healthProfile: obj)
                }catch let error{
                    self.healthProfilePresenterRef.onFail(message: error.localizedDescription)

                    print(error)
                }
            }


        }
        
        
        //  http://www.checkup.somee.com/api/AnalysisService/RetrieveHealthProfile?userId="
  
        
    }
    
    
    
    func updateUserData(userId: String, healthProfileObj: HealthProfile) {
        let healthProfileDic = try! DictionaryEncoder.encode(healthProfileObj)
                  let urlString = "http://www.checkup.somee.com/api/AnalysisService/SaveAndUpdateHealthProfile"
        Alamofire.request(urlString, method: .post, parameters: healthProfileDic,encoding: JSONEncoding.default, headers: nil).responseString {
                       response in
                       switch response.result {
                       case .success:
                           print(response)
                           self.healthProfilePresenterRef.onSucessUpdate()
                        
                         case .failure(let error):
                        print(error)
                        self.healthProfilePresenterRef.onFail(message: error.localizedDescription)
                        break
            }
           
       }
    
    
    
}
}
