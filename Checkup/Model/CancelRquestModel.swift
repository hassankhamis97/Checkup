//
//  CancelRquestModel.swift
//  Checkup
//
//  Created by kasper on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire
class CancelRequestModel: ICancelRequestModel{
    var cancelRequestpresneterRef : ICancelRequestPresenter!

    init(cancelRequestRef : ICancelRequestPresenter) {
        self.cancelRequestpresneterRef = cancelRequestRef
    }
    
     func cancelTestRequest(testObj:Test)
     {
             
             var test = Test()
             test = testObj
             test.status = "Canceled"
         let testDic = try! DictionaryEncoder.encode(test)
            

     // let params : [String : Any] = [ "Id" : testObj.id , "status" : "Canceled" ]
        
        let urlString = "http://checkup.somee.com/api/AnalysisService/UpdateAnalysis"
          
        
        Alamofire.request(urlString, method: .post , parameters: testDic , encoding: JSONEncoding.default, headers: nil).responseJSON {
                          response in
              switch response.result {
                                 case .success:
                                    print(response)
                self.cancelRequestpresneterRef.onSuccess()
                                 case .failure(let error):
                                   self.cancelRequestpresneterRef.onFail(message: "Error we couldn't update this test ... ")
                                 }
            
                      }

     }
    
    
}

  
