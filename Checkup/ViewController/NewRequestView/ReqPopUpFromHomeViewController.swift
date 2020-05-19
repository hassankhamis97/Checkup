//
//  ReqPopUpFromHomeViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ReqPopUpFromHomeViewController: UIViewController  {
//    var branchId: String?
//    var labId: String?
    var showNewRequestRef : IShowNewRequest?
    @IBAction func fromHomeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        showNewRequestRef!.transferToNewReq(isFromHome: true)
    }
    @IBAction func fromLabBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        showNewRequestRef!.transferToNewReq(isFromHome: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
