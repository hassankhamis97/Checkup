//
//  LabDescPresenter.swift
//  Checkup
//
//  Created by Aya on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class LabDescPresenter : ILabDescPresenter ,ICheckConnection{
    var params: LabDescriptionParams!
    func onSucessfullyConnected() {
        newLabDescModel = LabaDescriptionModel(descPreseneter: self)
         newLabDescModel.fetchLabDes(modelParams: params)
        newView.showIndicator()
    }
    
    func onFailConnected() {
        newView.hideIndicator()
        newView.errorMessage(msg: "No internet connection")
    }
    
   
    
  
    var paramsPresenter : LabDescriptionParams!    
    var newView : ILabDescView!
    var newLabDescModel : ILabDescModel!
    
    init(view : ILabDescView) {
        newView = view
    }
    
    func onSuccess(descObj: Branches , id: Int) {
        newView.showingDataOnView(labDescObj: descObj, id: id)
        newView.hideIndicator()
    }
    
    func onFail(msg: String) {
           newView.hideIndicator()
        newView.errorMessage(msg: msg)
       }
    
    func getDataFromLabDescModel(params: LabDescriptionParams) {
        self.params = params
        InternetConnection.checkInternetConnection(iCheckConnection: self)
    }
       
    
    
    
}
