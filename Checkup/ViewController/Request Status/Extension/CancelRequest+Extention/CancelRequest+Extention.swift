//
//  CancelRequest+Extention.swift
//  Checkup
//
//  Created by kasper on 6/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

extension RequestStatusTableViewController : ICancelRequestView
{
    func onCancelDone() {
      
         Alert.simpleOkAlert(title: "STATUS_CONFIRMATION", message: "STATUS_CANCEL_SUCCESS", viewRef: self)
        
//        Alert.showSimpleAlert(title: "STATUS_CONFIRMATION",message: "STATUS_CANCEL_SUCCESS", viewRef: self)
        //************ back **************/
       //   self.navigationController?.popViewController(animated: true)
        
        //        let alert = UIAlertController(title: "Confirmation", message: "Your Request has been canceled Successfully", preferredStyle: .alert)
        //
        //
        //
        //                self.present(alert, animated: true)
        //                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
        //                    print("You choosed Yes !")
        
        
        //  }))
        
        
        //        let alert = UIAlertController(title: "Confirmation", message: "Your Request has been canceled Successfully", preferredStyle: UIAlertController.Style.alert)
        //            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        //                alert.present(alert, animated: true, completion: nil)
        //        //************ back **************/
        //
        //          self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func oncancelFailed(error : String) {
        
        
        Alert.showSimpleAlert(title: "Sorry",message: "STATUS_CANCEL_FAILS", viewRef: self)
        
        
        //        let alert = UIAlertController(title: "Sorry", message: error, preferredStyle: UIAlertController.Style.alert)
        //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        //                    alert.present(alert, animated: true, completion: nil)
        
    }
    
    
    
}


