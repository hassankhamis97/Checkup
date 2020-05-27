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
    
    
    
    
    func getDataFromModel(govern: String) {
        filterModel = FilterLabModel(presenter: self)
        filterModel.fetchFilteredLab(govern: govern)
    }
    
    func onSuccess(filteredDara: FilterLab) {
        filterView.returnDataToView(filterLabObjInView: filteredDara)
    }
    
    func onFail() {
        
    }
    
    
}
