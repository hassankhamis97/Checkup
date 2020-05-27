//
//   StatisticsModel.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire

class StatisticsModel:IStatisticModel{
    
    
    let statisticPresenterRef:IStatisticPresenter!
    
    init(statisticPresenterRef:IStatisticPresenter!) {
        self.statisticPresenterRef=statisticPresenterRef
    }
    
    
    func getSample(userId: String, year: String) {
        
  Alamofire.request("http://checkup.somee.com/api/AnalysisService/GetHbA1cSampleStatistics?userId="+userId+"&year="+year).responseJSON { (response) in
                  if let JSON = response.result.value{
                      print("ha1bc")
                      print(JSON)
                      
                      do{
                          let sampleObj = try JSONDecoder().decode(HbA1cSample.self , from: response.data!)
                      
                          print(sampleObj)
                        
                        self.statisticPresenterRef.onSuccess(sampleObj: sampleObj)
                      }catch let error{
                        self.statisticPresenterRef.onFail(message: "error")
                          print(error)
                      }
                  }
                
                  
              }
        /* api & almofire*/
//        
//        sampleObj.year=year
//        sampleObj.sample=sample
        
     
        
        
    }
    
    
    
    
    
    
    
}
