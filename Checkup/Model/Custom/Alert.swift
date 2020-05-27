//
//  Alert.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
struct Alert {
    static func showSimpleAlert(title: String,message: String, viewRef: IView){
        let alert = UIAlertController(title: title.localized, message: message.localized, preferredStyle: UIAlertController.Style.alert)
//        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.red]), forKey: "attributedTitle")

        alert.addAction(UIAlertAction(title: "Ok".localized, style: UIAlertAction.Style.cancel, handler: nil))
        viewRef.present(alert, animated: true, completion: nil)
//        alert.view.tintColor = UIColor.red
    }
//    func showConfirmBox(msg:String, title:String,
//    firstBtnStr:String, firstSelector:(sampleParameter: String) -> returntype,
//    secondBtnStr:String, secondSelector:() -> returntype,
//    caller:UIViewController) {
//    //Your Code
//}
    static func showAdvancedAlert(title: String ,message: String, viewAdvancedAlertRef: IViewAdvancedAlert){
let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

            

              viewAdvancedAlertRef.present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "Yes".localized, style: .default, handler: { action in
                  print("You choosed Yes !")
                viewAdvancedAlertRef.pressOk()

              }))
              alert.addAction(UIAlertAction(title: "No".localized, style: .default, handler: { action in
//                        print("You choosed NOoOo !")
                viewAdvancedAlertRef.pressCancel()
                    }))
        }
    
}
