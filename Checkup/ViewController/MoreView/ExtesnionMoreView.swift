//
//  ExtesnionMoreView.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

extension MoreTableViewController:IProfileView{
    func renderProfileView(user: User) {
        self.user=user
        reloadData()
    
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func errorMessage(msg: String) {
        
    }
    
}
