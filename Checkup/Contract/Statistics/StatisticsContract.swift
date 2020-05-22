//
//  StatisticsContract.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

protocol IStatisticView:IBase {
    func renderView(sampleObj:HbA1cSample)
}

protocol IStatisticPresenter{
    
    func getSample(userId:String , year:String)
    func onSuccess(sampleObj:HbA1cSample)
    func onFail(message:String)
}

protocol IStatisticModel  {
    
   func getSample(userId:String , year:String)
    
}
