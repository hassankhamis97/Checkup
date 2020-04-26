//
//  SplashViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/26/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SwiftGifOrigin

import TransitionButton

class SplashViewController: CustomTransitionViewController {

    @IBOutlet weak var newImage: UIImageView!
    
    let img=UIImage.gif(name: "microscope")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newImage.loadGif(name: "microscope")
       

    
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
