//
//  IRequestStatus.swift
//  Checkup
//
//  Created by kasper on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IRequestStatusView  {
    func onReceiveRequestStatus(myObj:Test)
}
protocol IRequestStatusPresenter {
    func getRequest(labId: String,branchId: String,id : String )
    func onRequestReceived(myObj:Test)
    func onFail(message: String)
}
protocol IRequestStatusModel {
    func onRequestStatusRevieved(labId: String,branchId: String,id : String )
}
