//
//  DeleteRequestModel.swift
//  Checkup
//
//  Created by kasper on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//
import Alamofire
import Foundation
class DeleteRequestModel : IDeleteRequestModel {
    
    var deleteRequestPresenterRef : IDeleteRequestPresenter!
    
   
     init(deletePresenterRef : IDeleteRequestPresenter) {
        self.deleteRequestPresenterRef = deletePresenterRef
     }
    
func  deleteTestRequest(reqId : Int64)
{
     
//    let params : [ "id" : reqId ]
           
           let urlString = "http://checkup.somee.com/api/AnalysisService/DeleteClientAnalysisRequest?testId=\(reqId)"
           // , parameters: params
           Alamofire.request(urlString, method: .get , encoding: JSONEncoding.default, headers: nil).responseJSON {
                             response in
                 switch response.result {
                                    case .success:
                                       print(response)
                                        self.deleteRequestPresenterRef.onDeleteCompleted()
                                    case .failure(let error):
                                        self.deleteRequestPresenterRef.onDeleteFaild()
                                    }
               
                         }

     
    
}

}
