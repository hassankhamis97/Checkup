//
//  GetRequestData.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension ResultDetailsTableViewController : IRequestStatusView {
    func onReceiveRequestStatus(myObj: Test) {
        testObj = myObj
        descriptionTextView.text = testObj.description!
        resultDateTextView.text = testObj.dateResult!
        resultTimeTextView.text = testObj.timeResult!
        pdfCollectionView.reloadData()
    }
    
    func onConnectionFaile() {
        
    }
    
    
}
