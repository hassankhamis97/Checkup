//
//  MainChatViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class MainChatViewController: UIViewController {
    @IBOutlet var pearedTableView: UITableView!
//    var pearedUsers = [PearedUserData]()
    var pearedUsers : [PearedUserData] = [PearedUserData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        pearedTableView.register(UINib(nibName: "MainChatTableViewCell", bundle: nil), forCellReuseIdentifier: "mainChatCell")
        var pearedUsersObj = PearedUserData(idPearedUser: "512184", name: "Elmokhtabar", imgUrl: "https://mobresults.almokhtabar.com:88/UploadedImages/aacd8efc-6096-4230-ab87-5140e90c5e45.jpg", lastMessage: "send your lab ya 7ywan", lastMessageTime: "1589217899264")
        var pearedUsersObj1 = PearedUserData(idPearedUser: "512184", name: "Mahmoud", imgUrl: "https://img.youm7.com/ArticleImgs/2019/8/29/39460-BRG-Logo.jpg", lastMessage: "send your lab ya 7ywan", lastMessageTime: "1589217899264")
        pearedUsers.append(pearedUsersObj)
        pearedUsers.append(pearedUsersObj1)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
