//
//  EditProfileTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController {

    @IBOutlet weak var profileImg: UIImageView!
      var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImg.layer.masksToBounds = false
        profileImg.layer.cornerRadius=profileImg.frame.width / 2
        profileImg.clipsToBounds = true
        
         self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }

    @IBAction func changeImgBtn(_ sender: Any) {
        self.imagePicker.present(from: sender as! UIView)
      
    }
}
extension EditProfileTableViewController: ImagePickerDelegate {

  func didSelect(image: UIImage?) {
      self.profileImg.image = image
  }
}
