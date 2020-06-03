//
//  BranchDescPresenter.swift
//  Checkup
//
//  Created by Aya on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class BranchDescPresenter : IBranchDescPresenter {
   
    
    
    var branchDescModel : IBranchDescModel!
    var branchDescView : IBranchDescView!
    
    init(view : IBranchDescView) {
        branchDescView = view
    }
    
    
  
    func getDataFromModel(id: String) {
           
        branchDescModel = BranchDescModel(presenter: self)
        branchDescModel.fetchBranchDesc(id: id)
       }
       
       
    
    func onSuccess(branchDescObj: BranchDescription) {
        branchDescView.showDataToView(barnchDescObjInView: branchDescObj)
    
    }
    
    
    func onFail() {
        
    }
    
    
    
    
    
}
