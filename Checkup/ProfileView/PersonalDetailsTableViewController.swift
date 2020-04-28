//
//  PersonalDetailsTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class PersonalDetailsTableViewController: UITableViewController {

    @IBOutlet weak var profileImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

                 profileImg.layer.masksToBounds = false
                 profileImg.layer.cornerRadius=profileImg.frame.width / 2
                 profileImg.clipsToBounds = true
    }
}
