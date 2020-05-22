//
//  CancelRequestPresenter.swift
//  Checkup
//
//  Created by kasper on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class CancelRequestPresenter: ICancelRequestPresenter {
    
    var cancelRequestViewRef : ICancelRequestView!

       init(cancelRequestRef : ICancelRequestView) {
           self.cancelRequestViewRef = cancelRequestRef
       }
    
    func cancelRequest(testObj:Test) {
        var cancelRequestModel = CancelRequestModel(cancelRequestRef : self )
    }
    
    func onSuccess() {
        cancelRequestViewRef.onCancelDone()
    }
    
    func onFail(message: String) {
        cancelRequestViewRef.oncancelFailed(error : message)
    }
    
    
}
