//
//  MessagingChatViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class MessagingChatViewController: UIViewController {
    @IBOutlet var msgTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        msgTableView.register(UINib(nibName: "SenderCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        msgTableView.register(UINib(nibName: "RecieverCellTableViewCell", bundle: nil), forCellReuseIdentifier: "recieverCell")
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
