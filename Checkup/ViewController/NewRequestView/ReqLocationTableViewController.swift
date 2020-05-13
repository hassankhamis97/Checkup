//
//  ReqLocationTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ReqLocationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = (
              storyboard?.instantiateViewController(
              withIdentifier: "ReqLocPopUpSVC"))!
          present(vc, animated: true, completion: nil)
           }

        
        
    }


