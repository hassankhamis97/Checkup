//
//  NewRequestPresenter.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
class NewRequestPresenter: INewRequestPresenter {
    var newRequestViewRef : INewRequestView!
    init(newRequestViewRef : INewRequestView) {
        self.newRequestViewRef = newRequestViewRef
    }

    func saveRequest(testObj: Test, roushettaImages: [UIImage]) {
        newRequestViewRef.showIndicator()
        var newRequestModel = NewRequestModel(newRequestPresenterRef: self)
        newRequestModel.saveRequest(testObj: testObj, roushettaImages: roushettaImages)
    }
    
        
    func onSuccess() {
        newRequestViewRef.hideIndicator()
        newRequestViewRef.updateView()
    }
    
    func onFail(message: String) {
        newRequestViewRef.hideIndicator()
        newRequestViewRef.errorMessage(msg: message)
    }
    

}
