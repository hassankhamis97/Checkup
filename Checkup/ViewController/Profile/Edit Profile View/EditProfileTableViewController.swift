//
//  EditProfileTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase
import SDWebImage

class EditProfileTableViewController: UITableViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var genderTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var birthDateTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var mobileNumTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var landPhonNumTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var insuranceTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var addressTextField: SkyFloatingLabelTextFieldWithIcon!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var saveBtnOutlet: UIButton!
    var imagePicker: ImagePicker!
    var datePicker=UIDatePicker()
    var genderPickerView=UIPickerView()
    
    let genderArray=["Male","Female"]
    var imageUrl:String!
    var addressObj:Address!
    var user=User()
    
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
        let profilePresenterRef = ProfilePresenter(profileView: self)
        let userId = Auth.auth().currentUser?.uid
        profilePresenterRef.getUser(userId: userId!)
    }
    
    func reloadData() {
        
        nameTextField.text=user.name
        emailTextField.text=user.email
        birthDateTextField.text=user.birthdate
        birthDateTextField.text=user.birthdate
        genderTextField.text=user.gender
        insuranceTextField.text=user.insurance
        addressTextField.text=user.address?.address
        let x = user.phone
        profileImg.sd_setImage(with: URL(string: user.imagePath ?? "users"), placeholderImage: UIImage(named: "users"))
        
        if (x != nil)
        {
            for phone in x!
            {
                
                
                if phone.isLand==true{
                    landPhonNumTextField.text=phone.number
                }
                else{
                    mobileNumTextField.text=phone.number
                }
                
                
            }
            
            
        }
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImg.layer.masksToBounds = false
        profileImg.layer.cornerRadius=profileImg.frame.width / 2
        profileImg.clipsToBounds = true
        activityIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
             activityIndicator.alpha=0
        
        imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        genderPickerView.delegate=self
        genderPickerView.dataSource=self
        genderTextField.inputView=genderPickerView
        
        createDatePicker()
        
        
    }
    
    @IBAction func changeImgBtn(_ sender: Any) {
        self.imagePicker.present(from: sender as! UIView)
        
    }
    
    
    
    
    
    // for gender picker view :
    
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
    
    
    
    
    
    
    
    
    
    
    @IBAction func editAddressBtn(_ sender: Any) {
        
        
              let vc = storyboard?.instantiateViewController(withIdentifier: "locationSVC") as! LocationTableViewController
              
        vc.flag=1;
        
              if let obj=user.address {
                   vc.addressObj = obj
              }
             
              
              navigationController?.pushViewController(vc, animated: true)

       
    }
    
    
    
    
    
    
    
    @IBAction func saveDataBtn(_ sender: Any) {
        
        let id=Auth.auth().currentUser?.uid
        let name=nameTextField.text
        let email = emailTextField.text
        let birthdate=birthDateTextField.text
        let gender=genderTextField.text
        let mobileNum=mobileNumTextField.text
        let landNum=landPhonNumTextField.text
        let insurance=insuranceTextField.text
        var address=addressObj
        
        var phoneArray=[Phone]()
        var mob=Phone(number: mobileNum, isLand: false)
        var land=Phone(number: landNum, isLand: true)
        phoneArray.append(mob)
        phoneArray.append(land)
        
        var user=User(id: id, name: name, email: email, birthdate: birthdate, gender: gender, phone: phoneArray, insurance: insurance, address: addressObj, imagePath:imageUrl)
        
        var editProfilePresenterRef = EditProfilePresenter(editProfileView: self)
        
        editProfilePresenterRef.editUser(user: user,img: profileImg.image!)
        
    }
    
}

