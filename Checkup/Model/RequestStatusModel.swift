//
//  RequestStatusModel.swift
//  Checkup
//
//  Created by kasper on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
import Alamofire
class RequestStatusModel : IRequestStatusModel {
    var requestStatusPresenter :IRequestStatusPresenter!
    
    init(requestPresenterRef : IRequestStatusPresenter) {
        self.requestStatusPresenter = requestPresenterRef ;
    }

    func onRequestStatusRevieved(testId:String ) {
                           let urlString = "http://www.checkup.somee.com/api/AnalysisService/GetSpecificTest?testId=\(testId)"
                //   let params: [String: String] = ["Id": testId]
             
               Alamofire.request(urlString, method: .get,encoding: JSONEncoding.default, headers: nil).responseString {
                               response in
                   
                   guard let testResponse = response.value
                    else { return }
                    print(response)
                   do {
                       let test =  try JSONDecoder().decode(Test.self, from: response.data!)
                       print(test)
                     self.requestStatusPresenter.onRequestReceived(myObj:test)
                   }catch let error{
                       
                    print(error)
                   }
                   
                   

                           }


}
}
