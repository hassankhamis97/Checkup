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
    @IBAction func closePopupAction(_ sender: UIButton) {
        sender.pulsate()
        dismiss(animated: true, completion: nil)
    }
    var showNewRequestRef : IShowNewRequest?
    var elementIndex : Int!
    @IBAction func fromHomeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        showNewRequestRef!.transferToNewReq(isFromHome: true,index: elementIndex)
    }
    @IBAction func fromLabBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        showNewRequestRef!.transferToNewReq(isFromHome: false, index: elementIndex)
    }
    
    
     @IBOutlet weak var IsFromHomeBtnOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        IsFromHomeBtnOutlet.layer.cornerRadius=10
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
