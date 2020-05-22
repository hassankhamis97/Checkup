//
//  LabDescPresenter.swift
//  Checkup
//
//  Created by Aya on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class LabDescPresenter : ILabDescPresenter{
   
    
    
    var newView : ILabDescView!
    var newLabDescModel : ILabDescModel!
    
    init(view : ILabDescView) {
        newView = view
    }
    
    func onSuccess(descObj: Branches) {
        newView.showingDataOnView(labDescObj: descObj)
        
    }
    
    
    
    func onFail() {
        
    }
    
    func getDataFromLabDescModel() {
        newLabDescModel = LabaDescriptionModel(descPreseneter: self)
        newLabDescModel.fetchLabDes()
       
    }
       
    
    
    
}
