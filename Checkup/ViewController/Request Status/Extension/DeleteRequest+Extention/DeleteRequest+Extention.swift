//
//  DeleteRequest+Extention.swift
//  Checkup
//
//  Created by kasper on 6/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

extension RequestStatusTableViewController : IDeleteRequestView
{
    func onRequetDeleted() {
//        Alert.showSimpleAlert(title: "INFORMATION",message: "STATUS_DELETION_SUCCESS", viewRef: self)
        Alert.simpleOkAlert(title: "INFORMATION", message: "STATUS_DELETION_SUCCESS".localized, viewRef: self)
//        //************ back **************/
//        self.navigationController?.popViewController(animated: true)
        
        
        
        //     let alert = UIAlertController(title: "Confirmation", message: "Your Request has been Deleted Successfully", preferredStyle: UIAlertController.Style.alert)
        //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        //                    alert.present(alert, animated: true, completion: nil)
    }
    
    func onRequetFailed() {
        Alert.showSimpleAlert(title: "sorry",message: "STATUS_DELETION_FAILS", viewRef: self)
        
        //        let alert = UIAlertController(title: "Sorry", message: "Faild to Delete this Request", preferredStyle: UIAlertController.Style.alert)
        //                   alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        //                       alert.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}



