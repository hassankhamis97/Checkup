//
//  GetRequestsPresenter.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
class GetRequestsPresenter: IGetRequestsPresenter {
    
    var getRequestsViewRef : IGetRequestsView!
    init(getRequestsViewRef : IGetRequestsView) {
        self.getRequestsViewRef = getRequestsViewRef
    }

    func getRequests() {
        getRequestsViewRef.showIndicator()
        var newRequestModel = GetRequestsModel(getRequestsPresenterRef: self)
        newRequestModel.getRequests()
        
    }
    
        
    func onSuccess(requests: [Request]) {
        getRequestsViewRef.hideIndicator()
        getRequestsViewRef.updateView(requests: requests)
    }
    
    func onFail(message: String) {
        getRequestsViewRef.hideIndicator()
        getRequestsViewRef.errorMessage(msg: message)
    }
    

}
