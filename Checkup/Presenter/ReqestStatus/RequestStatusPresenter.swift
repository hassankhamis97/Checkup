//
//  RequestStatusPresenter.swift
//  Checkup
//
//  Created by kasper on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class RequestStatusPresenter : IRequestStatusPresenter{
   

      
      
      var requestViewRef : IRequestStatusView!
      init(requestViewRef : IRequestStatusView) {
          self.requestViewRef = requestViewRef
      }

    func getRequest(testId:String) {
        
           var requestStatusModel = RequestStatusModel(requestPresenterRef : self)
        requestStatusModel.onRequestStatusRevieved(testId:testId)
        
    }
    
    func onRequestReceived(myObj:Test) {
        requestViewRef.onReceiveRequestStatus(myObj: myObj)
    }
    
    func onFail(message: String) {
        
    }
    
    
    

}
