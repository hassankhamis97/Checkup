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
    static func showValidationAlert(message: String, viewRef: IView){
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.red]), forKey: "attributedTitle")

        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        viewRef.present(alert, animated: true, completion: nil)
        alert.view.tintColor = UIColor.red

    }
}
