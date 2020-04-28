//
//  SignUpTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import UIColor_Hex_Swift

class SignUpTableViewController: UITableViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    @IBOutlet weak var testDate: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var birthDateText: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var profileImg: UIImageView!
   
    
    @IBOutlet weak var genderText: SkyFloatingLabelTextFieldWithIcon!
    
    
    let datePicker=UIDatePicker()
    var imagePicker: ImagePicker!
    var pickerView=UIPickerView()
    
    
    var genderArray=["Male","Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.masksToBounds = false
        profileImg.layer.cornerRadius=profileImg.frame.width / 2
        profileImg.clipsToBounds = true
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        pickerView.delegate=self
        pickerView.dataSource=self
        genderText.inputView=pickerView
        
        
        
       
        createDatePicker()
    }
    
    
    func createDatePicker(){
        
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        let doneBtn=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:#selector(donePressed))
        toolbar.setItems(([doneBtn]), animated: true)
        birthDateText.inputAccessoryView=toolbar
        birthDateText.inputView=datePicker
        datePicker.datePickerMode = .date
        
    }
    
    @objc func donePressed(){
        
        
        let formatter=DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        birthDateText.text=formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
 
      return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
     
        return genderArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        genderText.text=genderArray[row]
        genderText.resignFirstResponder()
    }
    
    
    
    @IBAction func addProfileImgBtn(_ sender: Any) {
         self.imagePicker.present(from: sender as! UIView)
       }
    
}

extension SignUpTableViewController: ImagePickerDelegate {

  func didSelect(image: UIImage?) {
      self.profileImg.image = image
  }
}
