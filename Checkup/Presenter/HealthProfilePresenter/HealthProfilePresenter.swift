//
//  HealthProfilePresenter.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

class HealthProfilePresenter:IHealthProfilePresenter{
 
    
    var healthProfileView:IHealthProfileView!
    init(healthProfileView:IHealthProfileView) {
        self.healthProfileView=healthProfileView
    }
    
    
    func getHealthProfileData(userId: String) {
        
        let healthProfileModel=HealthProfileModel(healthProfilePresenterRef: self)
        
        healthProfileModel.getHealthProfileData(userId: userId)
        
        
    }
    
    func onSuccess(healthProfile: HealthProfile) {
        
        healthProfileView.renderHealthProfileView(healthProfile: healthProfile)
        
    }
    
    func onFail(message: String) {
        healthProfileView.errorMessage(msg: message)
        
    }
    
    
    
    func updateUserData(userId: String, healthProfileObj: HealthProfile) {
         let healthProfileModel=HealthProfileModel(healthProfilePresenterRef: self)
                
                healthProfileModel.updateUserData(userId: userId,healthProfileObj: healthProfileObj)
     }
     
     func onSucessUpdate() {
        healthProfileView.renderUpdatedHealthProfileView()
     }
     
    
    
    
    
}
