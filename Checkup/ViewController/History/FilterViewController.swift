//
//  FilterViewController.swift
//  Checkup
//
//  Created by Aya on 5/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeTapped))

        // Do any additional setup after loading the view.
    }
    @objc func closeTapped(){
        navigationController?.popViewController(animated: true)
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
