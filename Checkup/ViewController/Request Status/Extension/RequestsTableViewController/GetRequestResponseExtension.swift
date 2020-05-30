//
//  GetRequestResponseExtension.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension RequestsTableViewController : IGetRequestsView , IUpdateNotificationFlagView{
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if(requests!.count == 0 || !isBottom)
        {
//            isBottom = false
        isWaitingData = true
        tableView.reloadData()
        }
    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        isWaitingData = false
//        tableView.reloadData()
    }
    
    func errorMessage(msg: String) {
        if(requests!.count == 0 || !isBottom)
        {
            isBottom = false
        self.requests = []
        errorMsg = msg
        skip = 0
            tableView.reloadData()

        }


    }
    
    func updateView(requests: [Request]) {
        isBottom = false
        if skip == 0 {
            self.requests = requests
        }
        else{
            for req in requests {
                self.requests?.append(req)
            }
        }
        skip += requests.count
        tableView.reloadData()
    }
    
    
}
