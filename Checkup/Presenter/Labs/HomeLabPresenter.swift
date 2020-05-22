//
//  HomeLabPresenter.swift
//  Checkup
//
//  Created by azab on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

class HomeLabPresenter: IGetLabsPresenter {
    
    var getLabsViewRef : IGetLabsView
    init(getLabsViewRef : IGetLabsView) {
        self.getLabsViewRef = getLabsViewRef
    }
    
    func getLabs() {
        let labModel = GetLabsModel(getLabsPresenterRef: self)
        labModel.getLabs()
        getLabsViewRef.showIndicator()
    }
    
    func onSuccess(homeLabs: [HomeLab]) {
        getLabsViewRef.getLabsForRender(homeLabs: homeLabs)
        getLabsViewRef.hideIndicator()
    }
    
    func onFail(message: String) {
        getLabsViewRef.hideIndicator()
        getLabsViewRef.errorMessage(msg: message)
    }
    
}
