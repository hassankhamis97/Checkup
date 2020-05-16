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
        var newRequestModel = NewRequestModel(newRequestPresenterRef: self)
        newRequestModel.saveRequest(testObj: testObj, roushettaImages: roushettaImages)
    }
    
        
    func onSuccess() {
        
    }
    
    func onFail(message: String) {
        
    }
    

}
