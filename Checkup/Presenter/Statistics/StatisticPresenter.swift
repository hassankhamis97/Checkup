//
//  StatisticPresenter.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation


class StatisticPresenter :IStatisticPresenter,ICheckConnection{
    var year:String!
    var userId:String!
    func onSucessfullyConnected() {
        statisticsViewRef.showIndicator()
        let  statisticsModelRef = StatisticsModel(statisticPresenterRef: self)
               statisticsModelRef.getSample(userId: userId, year: year)
    }
    
    func onFailConnected() {
        statisticsViewRef.errorMessage(msg: "No internet connection")
        statisticsViewRef.hideIndicator()
    }
    
    
    
    let statisticsViewRef:IStatisticView!
    
    init( statisticsViewRef:IStatisticView) {
        self.statisticsViewRef=statisticsViewRef
    }
    
 
    
    func getSample(userId: String, year: String) {
     
        self.year=year
        self.userId=userId
        var check = InternetConnection.checkInternetConnection(iCheckConnection: self)
          
    }
    
    func onSuccess(sampleObj: HbA1cSample) {
        
        statisticsViewRef.renderView(sampleObj: sampleObj)
        statisticsViewRef.hideIndicator()
        
    }
    
    func onFail(message: String) {
        statisticsViewRef.errorMessage(msg: message)
    }
    
    
    
    
    
    
    
    
    
    
}
