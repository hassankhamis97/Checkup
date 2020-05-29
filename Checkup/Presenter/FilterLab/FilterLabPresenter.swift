//
//  FilterLaPresenter.swift
//  Checkup
//
//  Created by Aya on 5/26/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

class FilterLabPresenter: IFilterLabPresenter {
 
  
   
    var filterView : IFilterLabView!
    var filterModel : IFilterLabModel!
    
    
    
    init(view : IFilterLabView) {
        filterView = view
    }
    

    func getDataFromModel() {
        filterModel = FilterLabModel(presenter: self)
        filterModel.fetchFilteredLab()
    }
    
    func onSuccess(filteredData: [FilterGovern]) {
         filterView.returnDataToView(filterLabArrInView: filteredData)
     }
   
    func onFail() {
        
    }
    
    
}
