//
//  NewRequestPresenter.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
class NewRequestPresenter: INewRequestPresenter , ICheckConnection{
   
    
    var newRequestViewRef : INewRequestView!
    var testObj: Test!
    var roushettaImages: [UIImage]!
    init(newRequestViewRef : INewRequestView) {
        self.newRequestViewRef = newRequestViewRef
    }

    func saveRequest(testObj: Test, roushettaImages: [UIImage]) {
        self.testObj = testObj
        self.roushettaImages = roushettaImages
        newRequestViewRef.showIndicator()
        var newRequestModel = NewRequestModel(newRequestPresenterRef: self)
        newRequestModel.saveRequest(testObj: testObj, roushettaImages: roushettaImages)
        InternetConnection.checkInternetConnection(iCheckConnection: self)
    }
    
        
    func onSuccess() {
        newRequestViewRef.hideIndicator()
        newRequestViewRef.updateView()
    }
    
    func onFail(message: String) {
        newRequestViewRef.hideIndicator()
        newRequestViewRef.errorMessage(msg: message)
    }
    func onSucessfullyConnected() {
//           newRequestViewRef.showIndicator()
//           var newRequestModel = NewRequestModel(newRequestPresenterRef: self)
//           newRequestModel.saveRequest(testObj: testObj, roushettaImages: roushettaImages)
       }
       
       func onFailConnected() {
           newRequestViewRef.hideIndicator()
           newRequestViewRef.errorMessage(msg: "No internet connection")
       }

}
