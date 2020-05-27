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
    var manualNotificationPresenterRef : IManualNotificationPresenter!
    var ref: DatabaseReference!
    init(manualNotificationPresenterRef : IManualNotificationPresenter) {
        self.manualNotificationPresenterRef = manualNotificationPresenterRef
        
        ref = Database.database().reference()
    }
    func getNotificationNumbers() {
        ref.child("Notification").child(Auth.auth().currentUser!.uid).setValue(["getNotified": "1"])
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
                
                self.manualNotificationPresenterRef.onSuccess(manualNotification: manualNotificationObj)
                }
                catch let error {
                    self.manualNotificationPresenterRef.onFail(errorMsg: error.localizedDescription)
                }
                break
            case .failure(let error):
                self.manualNotificationPresenterRef.onFail(errorMsg: error.localizedDescription)
                print(error)
                break
            }
            }
        })

    }

}
