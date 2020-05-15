//
//  IBase.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IBase {
    func showIndicator()
    func hideIndicator()
    func errorMessage(msg: String) 
}
