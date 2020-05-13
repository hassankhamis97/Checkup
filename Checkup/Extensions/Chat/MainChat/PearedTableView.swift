//
//  PearedTableView.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
extension MainChatViewController : UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pearedUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainChatCell", for: indexPath) as! MainChatTableViewCell
        cell.pearedUserName.text = pearedUsers[indexPath.row].name!
        cell.pearedUserImg.sd_setImage(with: URL(string: pearedUsers[indexPath.row].imgUrl!), placeholderImage:UIImage(named: "placeholder.png"))
        cell.lastMessage.text = pearedUsers[indexPath.row].lastMessage!
        cell.lastMessageTime.text = getDateFromTimeStamp(timeStamp: Int64(pearedUsers[indexPath.row].lastMessageTime!) as! Int64)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let messagingSB = storyboard?.instantiateViewController(withIdentifier: "messagingChatSVC") else { return }
        self.navigationController?.pushViewController(messagingSB, animated: true)
    
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
}
