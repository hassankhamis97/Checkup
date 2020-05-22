//
//  ICancelRequest.swift
//  Checkup
//
//  Created by kasper on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol ICancelRequestView {
 
    func onCancelDone()
    func oncancelFailed(error : String )
}

protocol ICancelRequestPresenter {
   
    func cancelRequest(testObj:Test)
    func onSuccess()
    func onFail(message: String)
}


protocol ICancelRequestModel {
    func cancelTestRequest(testObj:Test)
}
