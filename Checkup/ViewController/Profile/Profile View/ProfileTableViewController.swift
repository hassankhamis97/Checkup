//
//  ProfileTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SDWebImage
import Firebase

class ProfileTableViewController: UITableViewController {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var birthDateTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var genderTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var mobileTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var landPhoneTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var insuranceTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var addressTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var profileStrengthProgressBar: UIProgressView!
    

    
     var user=User()
    var counter:Int!
    
    var profilePresenterRef:ProfilePresenter!
    override func viewWillAppear(_ animated: Bool) {
        counter=0;
        profilePresenterRef = ProfilePresenter(profileView: self)
               let userId = Auth.auth().currentUser?.uid
        
               profilePresenterRef.getUser(userId: userId!)
        
                
    }
    
    
    func reloadData(){
        
        
        userName.text=user.name
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
                    landPhoneTextField.text=phone.number
                }
                else{
                    mobileTextField.text=phone.number
                }
                
                
            }
            
            
        }
        
        
        updateCounter()
        updateProgressBar()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.masksToBounds = false
        profileImg.layer.cornerRadius=profileImg.frame.width / 2
        profileImg.clipsToBounds = true
        
        
   
    }
    
    
    
    @IBAction func editProfileBtn(_ sender: Any) {
        
       
            let ref=self.storyboard?.instantiateViewController(withIdentifier:"editSvc") as! EditProfileTableViewController
        
//        ref.user=user
        
            navigationController?.pushViewController(ref, animated: true)
            
            
         
        
    }
    
    
    
    
    @IBAction func previewAddressBtn(_ sender: Any) {
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "locationSVC") as! LocationTableViewController
        
        
        if let obj=user.address {
             vc.addressObj = obj
        }
       
        
        navigationController?.pushViewController(vc, animated: true)

}
}
