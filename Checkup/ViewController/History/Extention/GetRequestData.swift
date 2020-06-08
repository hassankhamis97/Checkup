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
        descriptionTextView.text = testObj.description ?? "RESULT_NO_DESCRIPTION".localized
        resultDateTextView.text = testObj.dateResult ?? "RESULT_NO_Date".localized
        resultTimeTextView.text = testObj.timeResult ?? "RESULT_NO_TIME".localized
        pdfCollectionView.reloadData()
    }
   
    func onConnectionFaile() {
        
    }
    
    
}
