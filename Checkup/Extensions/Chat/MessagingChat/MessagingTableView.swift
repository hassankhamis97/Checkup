//
//  MessagingTableView.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
extension MessagingChatViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMessagesListReversed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if allMessagesListReversed[indexPath.row].contains("http") && indexPath.row%2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "senderImageCell", for: indexPath) as! SenderImageTableViewCell
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            //        cell.textLabel?.text = "ay 7agaaa"
                    // Configure the cell...
//            cell.recievedImg?.sd_setImage(with: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg", completed: nil)
//
            cell.sentImage.sd_setImage(with: URL(string: allMessagesListReversed[indexPath.row]), placeholderImage: UIImage(named: "placeholder.png"))
                    return cell
        }
        if allMessagesListReversed[indexPath.row].contains("http"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "recieverImageCell", for: indexPath) as! RecievedImageTableViewCell
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            //        cell.textLabel?.text = "ay 7agaaa"
                    // Configure the cell...
                    cell.recievedImg.sd_setImage(with: URL(string: allMessagesListReversed[indexPath.row]), placeholderImage: UIImage(named: "placeholder.png"))
                    return cell
        }
        if indexPath.row == 10{
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! DateTableViewCell

            //        cell.textLabel?.text = "ay 7agaaa"
                    // Configure the cell...
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.dateLabel.text = allMessagesListReversed[indexPath.row]
                    return cell
        }
        if indexPath.row%2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SenderCellTableViewCell

            //        cell.textLabel?.text = "ay 7agaaa"
                    // Configure the cell...
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.myLabel.text = allMessagesListReversed[indexPath.row]
                    return cell
        }
            
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "recieverCell", for: indexPath) as! RecieverCellTableViewCell
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            //        cell.textLabel?.text = "ay 7agaaa"
                    // Configure the cell...
                    cell.recieverLabel.text = allMessagesListReversed[indexPath.row]
                    return cell
        }
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let height = scrollView.frame.size.height
//        let contentYoffset = scrollView.contentOffset.y
//        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
//        if distanceFromBottom < height {
//            print(" you reached end of the table")
//        }
        
        if (isTop == false && msgTableView.contentOffset.y >= (msgTableView.contentSize.height - msgTableView.frame.size.height)) {
            isTop = true
            print(" you reached end of the table")
        }
        else if isTop==true && msgTableView.contentOffset.y < (msgTableView.contentSize.height - msgTableView.frame.size.height){
            isTop = false
        }
//        if (scrollView.contentOffset.y == 0) {
//            let x = 5
//            print(x)
//        }
    }
    @IBAction func sendMsgBtn(_ sender: Any) {
        guard let msg = msgTextField?.text else {
            return
        }
        allMessagesList.reversed()
        allMessagesList.append(msg)
        allMessagesListReversed = allMessagesList.reversed()
        msgTableView.reloadData()

    }
    
}
