//
//  GetRequestResponseExtension.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension RequestsTableViewController : IGetRequestsView{
    func showIndicator() {
        isWaitingData = true
        tableView.reloadData()
    }
    
    func hideIndicator() {
        isWaitingData = false
//        tableView.reloadData()
    }
    
    func errorMessage(msg: String) {
        self.requests = []
        errorMsg = msg
        skip = 0
        tableView.reloadData()

    }
    
    func updateView(requests: [Request]) {
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
