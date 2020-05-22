//
//  DeleteRequestPresenter.swift
//  Checkup
//
//  Created by kasper on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class DeleteRequestPresenter: IDeleteRequestPresenter {
 
    var deleteRequestViewRef : IDeleteRequestView!

        init(deleteRequestRef : IDeleteRequestView) {
            self.deleteRequestViewRef = deleteRequestRef
        }
    
    func  deleteRequest (reqId : Int64)
    {
        var deleteModel  = DeleteRequestModel(deletePresenterRef : self)
        deleteModel.deleteTestRequest(reqId : reqId)
    }
    func  onDeleteCompleted()
    {
        deleteRequestViewRef.onRequetDeleted()
        
    }
    func  onDeleteFaild()
    {
         deleteRequestViewRef.onRequetFailed()
    }

}
