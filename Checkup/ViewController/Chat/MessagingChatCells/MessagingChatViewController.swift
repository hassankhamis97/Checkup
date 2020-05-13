//
//  MessagingChatViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class MessagingChatViewController: UIViewController {
    @IBOutlet var msgTextField: UITextField!

    @IBOutlet var msgTableView: UITableView!
    var isTop = false
    var allMessagesList : [String] = []
    var allMessagesListReversed : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        msgTextField.layer.cornerRadius = 15.0
        msgTextField.layer.borderWidth = 2.0
//        msgTextField.layer.borderColor = UIColor.red.cgColor
//        msgTextField.layer.borderColor = UIColor.
        msgTextField.layer.borderColor = UIColor(red: 235, green: 235, blue: 235, alpha: 1.0).cgColor
        msgTableView.register(UINib(nibName: "SenderCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        msgTableView.register(UINib(nibName: "RecieverCellTableViewCell", bundle: nil), forCellReuseIdentifier: "recieverCell")
        msgTableView.register(UINib(nibName: "SenderImageTableViewCell", bundle: nil), forCellReuseIdentifier: "senderImageCell")
        msgTableView.register(UINib(nibName: "RecievedImageTableViewCell", bundle: nil), forCellReuseIdentifier: "recieverImageCell")
        msgTableView.register(UINib(nibName: "DateTableViewCell", bundle: nil), forCellReuseIdentifier: "dateCell")
        // for reversed of tableview
        msgTableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        allMessagesList.append("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1402&q=80")
        allMessagesList.append("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg")
        allMessagesListReversed = allMessagesList.reversed()
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
