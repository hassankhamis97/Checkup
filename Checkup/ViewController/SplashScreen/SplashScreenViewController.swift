//
//  SplashScreenViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/9/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class SplashScreenViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.3) {
                   // your code here For Pushing to Another Screen
                   let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "homeSVC") as! HomeViewController
                   self.navigationController?.pushViewController(secondVC, animated: true)
               }
//            
            let animated_image =   UIImage.gif(asset: "checkupLogoGif")
//        var  imageView=UIImageView()
            imageView.animationImages = animated_image?.images
            imageView.animationDuration=4
            imageView.animationRepeatCount = 1
            imageView.startAnimating()
        
//        view.addSubview(imageView)
//                
        
        
  
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
