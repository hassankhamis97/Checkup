//
//  TestType.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
enum TestType: String {
    case PendingForLabConfirmation = "PendingForLabConfirmation", PendingForTakingTheSample = "PendingForTakingTheSample", PendingForResult = "PendingForResult", Refused = "Refused", Done = "Done"
}
