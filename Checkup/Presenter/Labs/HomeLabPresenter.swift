//
//  HomeLabPresenter.swift
//  Checkup
//
//  Created by azab on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

class HomeLabPresenter: IGetLabsPresenter {
    
    func getSearchedLabs(name: String) {
        let labModel = GetLabsModel(getLabsPresenterRef: self)
        labModel.getSearchedLabs(name: name)
        getLabsViewRef.showIndicator()
    }
    
    
    var getLabsViewRef : IGetLabsView
    init(getLabsViewRef : IGetLabsView) {
        self.getLabsViewRef = getLabsViewRef
    }
    
    func getLabs(take: Int, skip: Int) {
        let labModel = GetLabsModel(getLabsPresenterRef: self)
        labModel.getLabs(take: take, skip: skip)
        getLabsViewRef.showIndicator()
    }
    
    func onSuccess(homeLabs: [HomeLab], str: String) {
        if str == "filtered" {
             getLabsViewRef.getLabsForRender(homeLabs: homeLabs)
        } else if str == "search" {
            getLabsViewRef.getSearchedLabs(seachedHomeLabs: homeLabs)
        }
       
        getLabsViewRef.hideIndicator()
    }
    
    func onFail(message: String) {
        getLabsViewRef.hideIndicator()
        getLabsViewRef.errorMessage(msg: message)
    }
    
}
