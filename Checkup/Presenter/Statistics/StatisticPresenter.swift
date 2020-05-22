//
//  StatisticPresenter.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation


class StatisticPresenter :IStatisticPresenter{
    
    
    let statisticsViewRef:IStatisticView!
    
    init( statisticsViewRef:IStatisticView) {
        self.statisticsViewRef=statisticsViewRef
    }
    
 
    
    func getSample(userId: String, year: String) {
        let  statisticsModelRef = StatisticsModel(statisticPresenterRef: self)
        statisticsModelRef.getSample(userId: userId, year: year)
    }
    
    func onSuccess(sampleObj: HbA1cSample) {
        
        statisticsViewRef.renderView(sampleObj: sampleObj)
        
    }
    
    func onFail(message: String) {
        statisticsViewRef.errorMessage(msg: message)
    }
    
    
    
    
    
    
    
    
    
    
}
