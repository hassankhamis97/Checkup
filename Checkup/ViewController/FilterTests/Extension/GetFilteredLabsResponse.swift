//
//  GetFilteredLabsResponse.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension FilterTestViewController : IGetFilteredLabsView{
    func updateView(filterLabs: [FilterLab]) {
        self.labsList = filterLabs
        self.labsList.insert(FilterLab(id: "0", name: "All", isChecked: false), at: 0)
        self.tableViewOutlet.reloadData()
    }
    
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        isWaitingData = true
        self.tableViewOutlet.reloadData()
    }
    
    func hideIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        isWaitingData = false
    }
    
    func errorMessage(msg: String) {
        errorMsg = msg
        self.tableViewOutlet.reloadData()
    }
    
    
}
