//
//  ManualNotificationModel.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
import Alamofire
import SwiftyJSON
class ManualNotificationModel: IManualNotificationModel {
    
    
    var notificationPresenterRef : INotificationPresenter!
    var ref: DatabaseReference!
    init(notificationPresenterRef : INotificationPresenter) {
        self.notificationPresenterRef = notificationPresenterRef
        
        ref = Database.database().reference()
    }
    func getNotificationNumbers() {
        if Auth.auth().currentUser!.uid != nil
        {
       if let manualNotificationPresenterRef = notificationPresenterRef as? IManualNotificationPresenter { ref.child("Notification").child(Auth.auth().currentUser!.uid).setValue(["getNotified": self.ref.childByAutoId().key!])
        ref.child("Notification").child(Auth.auth().currentUser!.uid).observe(.value, with: { (snapshot) in
            let urlString = "http://www.checkup.somee.com/api/AnalysisService/GetNotificationNumbers?userId=\(Auth.auth().currentUser!.uid)"
            Alamofire.request(urlString).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                debugPrint(response)
                let json = JSON(response.data)
                print(json)
                do{
                let manualNotificationObj = try JSONDecoder().decode(ManualNotification.self , from: response.data!)
                
                manualNotificationPresenterRef.onSuccess(manualNotification: manualNotificationObj)
                }
                catch let error {
                    manualNotificationPresenterRef.onFail(errorMsg: error.localizedDescription)
                }
                break
            case .failure(let error):
                manualNotificationPresenterRef.onFail(errorMsg: error.localizedDescription)
                print(error)
                break
            }
            }
        })
        }
        }
    }
    func updateNotificationFlag(testId: Int64) {
        if let updateNotificationFlagPresenterRef = notificationPresenterRef as? IUpdateNotificationFlagPresenter {
        let urlString = "http://www.checkup.somee.com/api/AnalysisService/UpdateNotifiedFalse?testId=\(testId)"
        Alamofire.request(urlString).validate().responseJSON { response in
        switch response.result {
                            case .success(let value):
                                if value as! Int == 1 {
                                    self.ref.child("Notification").child(Auth.auth().currentUser!.uid).setValue(["getNotified": self.ref.childByAutoId().key!])
                                }
                                debugPrint(response)
                               
                                break
                            case .failure(let error):
        //                        self.newRequestPresenterRef.onFail(message: error.localizedDescription)
                                print(error)
                                break
                            }
        }
        }
    }
}
