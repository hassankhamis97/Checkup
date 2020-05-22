//
//  ExtensionStatisticsMvp.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

extension StatisticsTableViewController:IStatisticView{
    func renderView(sampleObj: HbA1cSample) {
        self.sampleObj=sampleObj
        setChart(dataPoints: sampleObj.year!, values: sampleObj.sample!)
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func errorMessage(msg: String) {
        
    }
    
    
    
    
    
    
    
    
}
