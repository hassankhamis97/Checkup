//
//   StatisticsModel.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

class StatisticsModel:IStatisticModel{
    
    
    let statisticPresenterRef:IStatisticPresenter!
    
    init(statisticPresenterRef:IStatisticPresenter!) {
        self.statisticPresenterRef=statisticPresenterRef
    }
    
    
    func getSample(userId: String, year: String) {
        
        var sampleObj=HbA1cSample()
      let  year = ["Jan 12,2009", "Feb 12,2009", "Mar 12,2009", "Apr 12,2009"]
       let sample = [20.0, 4.0,5.0,7.0]
        
        
        /* api & almofire*/
        
        sampleObj.year=year
        sampleObj.sample=sample
        
        statisticPresenterRef.onSuccess(sampleObj: sampleObj)
        
        
    }
    
    
    
    
    
    
    
}
