//
//  HealthProfileContract.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

protocol IHealthProfileView :IBase{
    func renderHealthProfileView (healthProfile:HealthProfile)
    func renderUpdatedHealthProfileView()
}
protocol IHealthProfilePresenter {
    func  getHealthProfileData(userId:String)
    func onSuccess(healthProfile:HealthProfile)
    func onFail(message: String)
    func updateUserData(userId:String,healthProfileObj:HealthProfile)
    func onSucessUpdate()
 
}
protocol IHealthProfileModel {
    func getHealthProfileData(userId:String)
    func updateUserData(userId:String,healthProfileObj:HealthProfile)
}
