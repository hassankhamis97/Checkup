//
//  RequestStatusPresenter.swift
//  Checkup
//
//  Created by kasper on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class RequestStatusPresenter : IRequestStatusPresenter , ICheckConnection{
    
    var id : String?
    func onSucessfullyConnected() {
      var requestStatusModel = RequestStatusModel(requestPresenterRef : self)
            requestStatusModel.onRequestStatusRevieved(testId:id!)
    }
    
    func onFailConnected() {
      
    }
    
   

      
      
      var requestViewRef : IRequestStatusView!
      init(requestViewRef : IRequestStatusView) {
          self.requestViewRef = requestViewRef
      }

    func getRequest(testId:String) {
        self.id = testId
          var check = InternetConnection.checkInternetConnection(iCheckConnection: self)
    }
    
    func onRequestReceived(myObj:Test) {
        requestViewRef.onReceiveRequestStatus(myObj: myObj)
             print("success ......")
    }
    
    func onFail(message: String) {
        print("faild ......")
    }
    
    
    

}
