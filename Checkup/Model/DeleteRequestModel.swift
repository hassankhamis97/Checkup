//
//  DeleteRequestModel.swift
//  Checkup
//
//  Created by kasper on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class DeleteRequestModel : IDeleteRequestModel {
    
    var deleteRequestPresenterRef : IDeleteRequestPresenter!
    
   
     init(deletePresenterRef : IDeleteRequestPresenter) {
        self.deleteRequestPresenterRef = deletePresenterRef
     }
    
func  deleteTestRequest(reqId : Int64)
{
    
}

}
