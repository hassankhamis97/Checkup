//
//  IDeleteRequest.swift
//  Checkup
//
//  Created by kasper on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

import Foundation
protocol IDeleteRequestView  {
    func onRequetDeleted()
    func onRequetFailed()
}
protocol IDeleteRequestPresenter {
 
    func  deleteRequest (reqId : Int64)
    func  onDeleteCompleted()
    func  onDeleteFaild()
}
protocol IDeleteRequestModel {
    func  deleteTestRequest(reqId : Int64)
}
