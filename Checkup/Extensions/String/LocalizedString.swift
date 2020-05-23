//
//  LocalizedString.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/23/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension String {
    var localized : String{
        return NSLocalizedString(self, comment: "")
    }
}
