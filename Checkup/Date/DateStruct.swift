//
//  DateStruct.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

// this struct for sorting date (Jun 5,2019)

struct HistoryObject: CustomStringConvertible {
    let dateString: String
    let value: Int

    var description: String {
        return "date: \(dateString), value: \(value)"
    }

}
