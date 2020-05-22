//
//  GetFilteredLabsPresenter.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
class GetFilteredLabsPresenter: IGetFilteredLabsPresenter {
    
    
    
    var getFilteredLabsViewRef : IGetFilteredLabsView!
    init(getFilteredLabsViewRef : IGetFilteredLabsView) {
        self.getFilteredLabsViewRef = getFilteredLabsViewRef
    }

    func getFilteredLabs() {
        getFilteredLabsViewRef.showIndicator()
        var newRequestModel = GetLabsModel(getFilteredLabsPresenter: self)
        newRequestModel.getFilteredLabs()
    }
    
    func onSuccess(filterLabs: [FilterLab]) {
        getFilteredLabsViewRef.hideIndicator()
        getFilteredLabsViewRef.updateView(filterLabs: filterLabs)
    }
    
    func onFail(message: String) {
        getFilteredLabsViewRef.hideIndicator()
        getFilteredLabsViewRef.errorMessage(msg: message)
    }
}
