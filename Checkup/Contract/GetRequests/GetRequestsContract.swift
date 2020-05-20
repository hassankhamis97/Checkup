//
//  GetRequestsContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IGetRequestsView : IBase {
    func updateView (requests: [Request])
}
protocol IGetRequestsPresenter {
    func getRequests(testFilter: TestFilter)
    func onSuccess(requests: [Request])
    func onFail(message: String)
}
protocol IGetRequestsModel {
    func getRequests(testFilter: TestFilter)
}
