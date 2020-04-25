//
//  SignupViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 4/8/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SDWebImage

class SignupViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    
    var name : String!
override func viewDidLoad() {
        super.viewDidLoad()
        var name2 = name
    myImage.sd_setImage(with: URL(string: "https://www.bigstockphoto.com/images/homepage/module-6.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
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
