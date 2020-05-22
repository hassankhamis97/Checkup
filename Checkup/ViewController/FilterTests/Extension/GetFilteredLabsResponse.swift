//
//  GetFilteredLabsResponse.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension FilterTestViewController : IGetFilteredLabsView{
    func updateView(filterLabs: [FilterLab]) {
        self.labsList = filterLabs
        self.tableViewOutlet.reloadData()
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func errorMessage(msg: String) {
        
    }
    
    
}
