//
//  ReqPopUpFromHomeViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ReqPopUpFromHomeViewController: UIViewController {
    var branchId: String?
    var labId: String?
    @IBAction func fromHomeBtn(_ sender: UIButton) {
        transferToNewReq(isFromHome: true)
    }
    @IBAction func fromLabBtn(_ sender: UIButton) {
        transferToNewReq(isFromHome: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func transferToNewReq(isFromHome: Bool) {
        var newRequestVC = storyboard!.instantiateViewController(withIdentifier: "newReqSVC") as! NewRequestTableViewController
         newRequestVC.branchId = branchId
        newRequestVC.labId = labId
        newRequestVC.isFromHome = isFromHome
         self.navigationController?.pushViewController(newRequestVC, animated: true)
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
