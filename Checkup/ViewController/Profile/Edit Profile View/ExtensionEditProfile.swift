//
//  ExtensionEditProfile.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
extension EditProfileTableViewController : ImagePickerDelegate{
    
    
    // for saving image to database 
    
//    func saveProfileImage(){
//
//        guard let imageSelected=self.profileImg.image else {
//
//            return
//        }
//
//        guard let imageData=imageSelected.jpegData(compressionQuality: 0.4) else{
//            return
//        }
//
//
//        let storageRef=Storage.storage().reference(forURL: "gs://checkup-23ffe.appspot.com")
//        let storageProfileRef=storageRef.child("profile").child(Auth.auth().currentUser!.uid)
//
//        let metaData=StorageMetadata()
//        metaData.contentType="image/jpg"
//
//
//
//        storageProfileRef.putData(imageData, metadata: metaData,completion:  { (storageMetaData, error) in
//            if error != nil{
//                print(error?.localizedDescription)
//                return
//            }
//            storageProfileRef.downloadURL(completion: { (url: URL?, error: Error?) in
//                print(url?.absoluteString) // <- Download URL
//            })
//        })
//
//
//
//
//
//
//    }
    
    
    
    
    
    // for date picker :
    
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
    
    
    
    // for image picker delegate : 
    
    func didSelect(image: UIImage?) {
        self.profileImg.image = image
    }
    
    
    
}
