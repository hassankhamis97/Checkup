//
//  LabDescPresenter.swift
//  Checkup
//
//  Created by Aya on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class LabDescPresenter : ILabDescPresenter{
  
    var paramsPresenter : LabDescriptionParams!    
    var newView : ILabDescView!
    var newLabDescModel : ILabDescModel!
    
    init(view : ILabDescView) {
        newView = view
    }
    
    func onSuccess(descObj: Branches , id: Int) {
        newView.showingDataOnView(labDescObj: descObj, id: id)
        
    }
    
    func onFail() {
        
    }
    
    func getDataFromLabDescModel(params: LabDescriptionParams) {
        newLabDescModel = LabaDescriptionModel(descPreseneter: self)
        newLabDescModel.fetchLabDes(modelParams: params)
       
    }
       
    
    
    
}
