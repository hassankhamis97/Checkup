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
     var imagePicker: ImagePicker!
   
    
    var name : String!
override func viewDidLoad() {
        super.viewDidLoad()
      
   
          self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    
    }

  
    @IBAction func btn(_ sender: Any) {
 
        self.imagePicker.present(from: sender as! UIView)
    }
    

}
extension SignupViewController: ImagePickerDelegate {

  func didSelect(image: UIImage?) {
      self.myImage.image = image
  }
}
