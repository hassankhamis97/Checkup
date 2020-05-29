//
//  ConvertTimeStampToDate.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    func getDateFromTimeStamp(timeStamp : Int64) -> String {
        
        var date1 = Date(milliseconds: Int64(timeStamp)) // "Dec 31, 1969, 4:00 PM" (PDT variant of
                let dateFormatter = DateFormatter()
                dateFormatter.timeZone = TimeZone(abbreviation: "GMT+4") //Set timezone that you want
                dateFormatter.locale = NSLocale.current
                dateFormatter.dateFormat = "h:mm a" //Specify your format that you want
        //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm a" //Specify your format that you want
                return dateFormatter.string(from: date1)
    }
    func getFullDateFromTimeStamp(timeStamp : Int64) -> String {
        
        var date1 = Date(milliseconds: Int64(timeStamp)) // "Dec 31, 1969, 4:00 PM" (PDT variant of
                let dateFormatter = DateFormatter()
                dateFormatter.timeZone = TimeZone(abbreviation: "GMT+4") //Set timezone that you want
                dateFormatter.locale = NSLocale.current
                dateFormatter.dateFormat = "MMM dd, yyyy h:mm a" //Specify your format that you want
        //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm a" //Specify your format that you want
                return dateFormatter.string(from: date1)
    }
}
