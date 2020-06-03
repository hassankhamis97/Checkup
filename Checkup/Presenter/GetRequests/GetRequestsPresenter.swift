//
//  GetRequestsPresenter.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
class GetRequestsPresenter: IGetRequestsPresenter , ICheckConnection{
    
    
    
    var getRequestsViewRef : IGetRequestsView!
    var testFilter: TestFilter!
    init(getRequestsViewRef : IGetRequestsView) {
        self.getRequestsViewRef = getRequestsViewRef
    }

    func getRequests(testFilter: TestFilter) {
        self.testFilter = testFilter
        getRequestsViewRef.showIndicator()
        var newRequestModel = GetRequestsModel(getRequestsPresenterRef: self)
        newRequestModel.getRequests(testFilter: testFilter)
        InternetConnection.checkInternetConnection(iCheckConnection: self)
        
        
    }
    
        
    func onSuccess(requests: [Request]) {
        getRequestsViewRef.hideIndicator()
        getRequestsViewRef.updateView(requests: requests)
    }
    
    func onFail(message: String) {
        getRequestsViewRef.hideIndicator()
        getRequestsViewRef.errorMessage(msg: message)
    }
    func onSucessfullyConnected() {
//        getRequestsViewRef.showIndicator()
//        var newRequestModel = GetRequestsModel(getRequestsPresenterRef: self)
//        newRequestModel.getRequests(testFilter: testFilter)
    }
    
    func onFailConnected() {
        self.getRequestsViewRef.hideIndicator()
        self.getRequestsViewRef.errorMessage(msg: "No internet connection")
    }

}
