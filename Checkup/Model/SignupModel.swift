//
//  SignupModel.swift
//  Checkup
//
//  Created by azab on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import RealmSwift
import FirebaseCore
import FirebaseFirestore

class SignupModel: ISignupModel {
    
    var singupPresenterRef : ISignupPresenter
    init(singupPresenterRef : ISignupPresenter) {
        self.singupPresenterRef = singupPresenterRef
    }
    func saveAuthDate(username: String, email: String, password: String, confirmPassword: String) {
        
        
        
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let x = error {
                    let err = x as NSError
                    switch err.code {
                    case AuthErrorCode.wrongPassword.rawValue:
                        print("wrong password")
                        self.singupPresenterRef.onFail(message: "wrong password")
                    case AuthErrorCode.invalidEmail.rawValue:
                        print("invalid email")
                        self.singupPresenterRef.onFail(message: "The email address is badly formatted.")
                    case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                        print("accountExistsWithDifferentCredential")
                        self.singupPresenterRef.onFail(message: "account Exists With Different Credential")
                    case AuthErrorCode.emailAlreadyInUse.rawValue:
                        print("Email is already exist")
                        self.singupPresenterRef.onFail(message: "Email is already exist")
                    default:
                        print("unknown error: \(err.localizedDescription)")
                        self.singupPresenterRef.onFail(message: "No Internet Connection")
                    }
                    
//                    self.singupPresenterRef.onFail(message: "Email is already exist")
                }
                else if authResult != nil {
                    
                    let id = authResult?.user.uid
                    let phoneArray=[Phone]()
                    let addressObj=Address()
                    let realTime=RealTime()
                    realTime.addUser(id: id ?? "", email: email, birthdate: "", gender: "", phone: phoneArray, insurance: "", address: addressObj, imagePath: "https://firebasestorage.googleapis.com/v0/b/checkup-23ffe.appspot.com/o/users.png?alt=media&token=8fba9f3d-0739-4b7f-afab-8ae7b6e1c442", name: username)
                    
                    SignupModel.saveToRealm(id: id ?? "0x", username: username)
                    SignupModel.addNameToFireStore(username: username, id: id ?? "0x")
                    self.singupPresenterRef.onSuccess()
                }
            }
           
    }
    
   class func saveToRealm(id: String, username: String) {
        //add user name & id to Realm
        if id.count > 0 && username.count > 0{
            let person = Person()
            person.id = id
            person.name = username
            let realm = try! Realm()
            try! realm.write {
                realm.add(person)
            }
        }
    }
    
    class func addNameToFireStore(username: String, id: String) {
        // Update one field, creating the document if it does not exist.
        Firestore.firestore().collection("users").document(id).setData([ "nickname": username, "id": id, "photoUrl": "https://firebasestorage.googleapis.com/v0/b/checkup-23ffe.appspot.com/o/users.png?alt=media&token=8fba9f3d-0739-4b7f-afab-8ae7b6e1c442", "type": AuthenticationType.user.rawValue ], merge: true)
    }
}
