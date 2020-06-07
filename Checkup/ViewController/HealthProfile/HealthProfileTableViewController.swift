//
//  HealthProfileTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/3/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase

class HealthProfileTableViewController: UITableViewController,IView ,UITextFieldDelegate{

    @IBOutlet weak var yesSufferDiabetesBtn: RadioButtonOutlet!
    
    @IBOutlet weak var noSufferDiabetesBtn: RadioButtonOutlet!
    
    @IBOutlet weak var yesSufferPressureBtn: RadioButtonOutlet!
    
    @IBOutlet weak var noSufferPressuresBtn: RadioButtonOutlet!
    
    @IBOutlet weak var yesTakeAntiBtn: RadioButtonOutlet!
    
    @IBOutlet weak var noTakeAntiBtn: RadioButtonOutlet!
    
    @IBOutlet weak var yesTakeHaemophiliaBtn: RadioButtonOutlet!
    
    @IBOutlet weak var noTakeHaemophiliaBtn: RadioButtonOutlet!
    
    
    @IBOutlet weak var diseaseNameTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var diabiabetesArray=[UIButton]()
    var pressurArray=[UIButton]()
    var antiBioticArray=[UIButton]()
    var haemophiliaArray=[UIButton]()
    var dieaseNamesArray=[String]()
    var healthProfie=HealthProfile()
    var healthProfilePresenterRef:HealthProfilePresenter!
    var userId=Auth.auth().currentUser!.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diabiabetesArray=[yesSufferDiabetesBtn,noSufferDiabetesBtn]
        pressurArray=[yesSufferPressureBtn,noSufferPressuresBtn]
        antiBioticArray=[yesTakeAntiBtn,noTakeAntiBtn]
        haemophiliaArray=[yesTakeHaemophiliaBtn,noTakeHaemophiliaBtn]
        
      setFuncAndTagToBtn(btnArray:diabiabetesArray,tag:0)
      setFuncAndTagToBtn(btnArray:pressurArray, tag: 1)
      setFuncAndTagToBtn(btnArray:antiBioticArray, tag: 2)
      setFuncAndTagToBtn(btnArray:  haemophiliaArray, tag: 3)
        
        diseaseNameTextField.delegate=self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
              
              view.addGestureRecognizer(tap)
  
    }

    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
         healthProfilePresenterRef=HealthProfilePresenter(healthProfileView: self)
               
          
               healthProfilePresenterRef.getHealthProfileData(userId: userId)
    }
    
    
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
             self.view.endEditing(true)
             return true
         }
    
    @objc func dismissKeyboard() {
             view.endEditing(true)
         }
    
    @IBAction func addDiseaseNameBtn(_ sender: Any) {
        
        if let  diseaseName=diseaseNameTextField.text
        {
            if diseaseName.count<=0{
                Alert.showSimpleAlert(title: "sorry", message: "Enter disease name please", viewRef: self)
            }
            else{
                  dieaseNamesArray.append(diseaseName)
                
            }
          
            collectionView.reloadData()
            tableView.reloadData()
            diseaseNameTextField.text=""
            dismissKeyboard()
        }
        
    }


    func setFuncAndTagToBtn(btnArray:[UIButton],tag:Int)
    {
        
        for btn in btnArray{
            
            btn.tag=tag
            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
          
            
            
        }
        
        
        
    }
    
    
    
        @objc func buttonAction(sender: UIButton!){
            
            
            if sender.tag==0{ // sufferFromDiabtes
                
                
                            for button in diabiabetesArray{
                                button.isSelected = false
                                button.backgroundColor = .clear
                            }
                
                     sender.isSelected = true
                     sender.pulsate()
                    sender.backgroundColor = UIColor.systemTeal
                if sender==diabiabetesArray[0]{
                    print ("yes diabtes")
                    healthProfie.isSuffreDiabetes=true
                 
                    }
                
                else{
                    print ("No diabtes")
                    healthProfie.isSuffreDiabetes=false
                 
                }
            }
            
            
        
          else if sender.tag==1{ // suffer From Pressure
                      
                      
                                  for button in pressurArray{
                                      button.isSelected = false
                                      button.backgroundColor = .clear
                                  }
                      
                           sender.isSelected = true
                           sender.pulsate()
                          sender.backgroundColor = UIColor.systemTeal
                      if sender==pressurArray[0]{
                          print ("yes pressure")
                        healthProfie.isSuffrePressure=true
                          }
                      
                      else{
                          print ("No pressure")
                        healthProfie.isSuffrePressure=false
                       
                      }
                  }
           
            
           else if sender.tag==2{ // Take antiBiotics
                                 
                                 
                                             for button in antiBioticArray{
                                                 button.isSelected = false
                                                 button.backgroundColor = .clear
                                             }
                                 
                                      sender.isSelected = true
                                      sender.pulsate()
                                     sender.backgroundColor = UIColor.systemTeal
                                 if sender==antiBioticArray[0]{
                                     print ("yes antibiotic")
                                    healthProfie.isSTakeantiBiotic=true
                                  
                                     }
                                 
                                 else{
                                     print ("No antibiotic")
                                    healthProfie.isSTakeantiBiotic=false
                                 }
                             }
            
            
            else if sender.tag==3{ // Take hemophilia
                                 
                                 
                                             for button in haemophiliaArray{
                                                 button.isSelected = false
                                                 button.backgroundColor = .clear
                                             }
                                 
                                      sender.isSelected = true
                                      sender.pulsate()
                                     sender.backgroundColor = UIColor.systemTeal
                                 if sender==haemophiliaArray[0]{
                                     print ("yes hemophilia")
                                  
                                    healthProfie.isTakehaemophilia=true
                                     }
                                 
                                 else{
                                     print ("No hemophilia")
                                    healthProfie.isTakehaemophilia=false
                                 }
                             }
            
            
}
    
    
    
    
    @IBAction func saveBtn(_ sender: Any) {
        if(checkValidation()){
        healthProfie.dieaseNamesArray
            = self.dieaseNamesArray
        healthProfie.userId=userId
        print(healthProfie)
        healthProfilePresenterRef.updateUserData(userId: userId, healthProfileObj: healthProfie)
        }
    }
    func checkValidation() -> Bool {
    //        var hasPhone = false
    //        if user.phone != nil {
    //
    //        }
            var message: String = ""
        if healthProfie.isSTakeantiBiotic == nil || healthProfie.isSuffreDiabetes == nil || healthProfie.isSuffrePressure == nil || healthProfie.isTakehaemophilia == nil{
                message = "Answer all the questions, please"
            }
            
//        else if healthProfie.isSuffreDiabetes == nil {
//    //            message = NSLocalizedString("alertDateMessageError", comment: "")
//                message = "Email is Required"
//            }
//            else if healthProfie.isSuffrePressure == nil {
//                message = "Password is Required"
//            }
//            else if healthProfie.isTakehaemophilia == nil {
//                message = "Password must be more than 6 characters"
//            }
            
            if !message.isEmpty {
                Alert.showSimpleAlert(title: "sorry", message: message, viewRef: self)
                return false
            }
            return true
        }
}
