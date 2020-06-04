//
//  GenaricAlertExtention.swift
//  Checkup
//
//  Created by kasper on 6/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension RequestStatusTableViewController : IViewAdvancedAlert ,IView , IOkAlert{
    // IOkAlert
    func onOkClicked() {
        //************ back **************/
            self.navigationController?.popViewController(animated: true)
    }
    
    /// ***********   Cancel Request Btn ********* //
    func pressOk() {
        
        
        
        if alertStatus == 0 // alertStatue = 0 Cancel
        {
            print("Cancel request .... !")
            
            var fullDateTimeString = ("\(self.testStatusObj.dateForTakingSample!) \(self.testStatusObj.timeForTakingSample!)")
            if self.canCancelRequest(requestDateTime:fullDateTimeString)
            {
                let cancelrequestPresenter = CancelRequestPresenter(cancelRequestRef : self)
                
                //var test = Test()
                // test.id = testStatusObj.id
                
                //  test.status = "Canceled"
                
                cancelrequestPresenter.cancelRequest(testObj: testStatusObj)
                
            }else {
                
                
                Alert.showSimpleAlert(title: "sorry",message: "STATUS_SORRY_CANCEL", viewRef: self)
                
                //  Alert.showAdvancedAlert(title: "STATUS_CONFIRMATION".localized, message: "STATUS_DELETE_CONFIRMATION".localized, viewAdvancedAlertRef: self)
                
                //                     let alert = UIAlertController(title: "Confirmation Message", message: "Sorry You can't cancel this request we are about to take your sample now if you insest please call the laboratory ?", preferredStyle: .alert)
                //
                //
                //                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                //                                 print("You choosed NOoOo !")
                //                            }))
                //                     self.present(alert, animated: true)
                
                
            }
            
        }
        else if alertStatus == 1 // alertStatus == 1 Delete
        {
            let deleteRequestPresenter = DeleteRequestPresenter(deleteRequestRef : self)
            
            deleteRequestPresenter.deleteRequest(reqId: self.testStatusObj.id!)
            
        }
        
        
    }
    
    func pressCancel() {
        
        print("Cancel Pressed !")
        
    }
    
    //  showAdvancedAlert(title: String ,message: String, viewAdvancedAlertRef: IViewAdvancedAlert)
}
