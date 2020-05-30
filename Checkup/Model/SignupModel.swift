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
        
        
        if username.count == 0 {
            
            self.singupPresenterRef.onFail(message: "Name is Required")
        } else if email.count == 0 {
            self.singupPresenterRef.onFail(message: "Email is Required")
        } else if password.count < 6  {
            self.singupPresenterRef.onFail(message: "Password is Required")
        } else if password != confirmPassword {
            self.singupPresenterRef.onFail(message: "confirmPassword does not match Password")
        } else {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let x = error {
                    let err = x as NSError
                    switch err.code {
                    case AuthErrorCode.wrongPassword.rawValue:
                        print("wrong password")
                        self.singupPresenterRef.onFail(message: "wrong password")
                    case AuthErrorCode.invalidEmail.rawValue:
                        print("invalid email")
                        self.singupPresenterRef.onFail(message: "invalid email")
                    case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                        print("accountExistsWithDifferentCredential")
                        self.singupPresenterRef.onFail(message: "accountExistsWithDifferentCredential")
                    case AuthErrorCode.emailAlreadyInUse.rawValue:
                        print("email is alreay in use")
                        self.singupPresenterRef.onFail(message: "email is alreay in use")
                    default:
                        print("unknown error: \(err.localizedDescription)")
                        self.singupPresenterRef.onFail(message: "No Internet Connection")
                    }
                    
                    self.singupPresenterRef.onFail(message: "Email is already exist")
                }
                else if authResult != nil {
                    
                    let id = authResult?.user.uid
                    let phoneArray=[Phone]()
                    let addressObj=Address()
                    let realTime=RealTime()
                    realTime.addUser(id: id ?? "", email: email, birthdate: "", gender: "", phone: phoneArray, insurance: "", address: addressObj, imagePath: "", name: username)
                    
                    self.saveToRealm(id: id ?? "0x", username: username)
                    self.addNameToFireStore(username: username, id: id ?? "0x")
                    self.singupPresenterRef.onSuccess()
                }
            }
        }   
    }
    
    func saveToRealm(id: String, username: String) {
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
    
    func addNameToFireStore(username: String, id: String) {
        // Update one field, creating the document if it does not exist.
        Firestore.firestore().collection("users").document(id).setData([ "nickname": username, "id": id, "photoUrl": "" ], merge: true)
    }
}
