//
//  ShowNewRequestFromPopup.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension LabDescTableViewController : IShowNewRequest{
    func transferToNewReq(isFromHome: Bool) {
        var newRequestVC = storyboard!.instantiateViewController(withIdentifier: "newReqSVC") as! NewRequestTableViewController
        newRequestVC.labId = "-M7Nzg7KJg0GX6jwDpRF"
        newRequestVC.branchId = "IaTcOwrdXhVBa7qx40FOkW5b94J3"
        newRequestVC.isFromHome = isFromHome
         self.navigationController?.pushViewController(newRequestVC, animated: true)
    }
}
