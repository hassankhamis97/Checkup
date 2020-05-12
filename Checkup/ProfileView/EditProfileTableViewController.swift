//
//  EditProfileTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class EditProfileTableViewController: UITableViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    

    @IBOutlet weak var genderTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var birthDateTextField: SkyFloatingLabelTextFieldWithIcon!
    
    
 
    
      var imagePicker: ImagePicker!
      let datePicker=UIDatePicker()
      var genderPickerView=UIPickerView()
    
    
    let genderArray=["Male","Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImg.layer.masksToBounds = false
        profileImg.layer.cornerRadius=profileImg.frame.width / 2
        profileImg.clipsToBounds = true
        
         self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        genderPickerView.delegate=self
        genderPickerView.dataSource=self
        
        genderTextField.inputView=genderPickerView
        
        createDatePicker()
    }

    @IBAction func changeImgBtn(_ sender: Any) {
        self.imagePicker.present(from: sender as! UIView)
      
    }
    
    
       func createDatePicker(){
           
           let toolbar=UIToolbar()
           toolbar.sizeToFit()
           let doneBtn=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:#selector(donePressed))
           toolbar.setItems(([doneBtn]), animated: true)
           birthDateTextField.inputAccessoryView=toolbar
           birthDateTextField.inputView=datePicker
           datePicker.datePickerMode = .date
           
       }
       
       @objc func donePressed(){
           
           
           let formatter=DateFormatter()
           formatter.dateStyle = .medium
           formatter.timeStyle = .none
           birthDateTextField.text=formatter.string(from: datePicker.date)
           self.view.endEditing(true)
       }

    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
     return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return genderArray[row]
      }
      
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          
          genderTextField.text=genderArray[row]
          genderTextField.resignFirstResponder()
      }
      
    
    
    
}
extension EditProfileTableViewController: ImagePickerDelegate {

  func didSelect(image: UIImage?) {
      self.profileImg.image = image
  }
}
