//
//  LoginTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/26/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import TransitionButton
import SkyFloatingLabelTextField
import UIColor_Hex_Swift
import Firebase
import GoogleSignIn
import RealmSwift

class LoginTableViewController: UITableViewController,UITextFieldDelegate, IView {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var emailTextView: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var passWordTextView: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var googleLogin: UIButton!
    
    @IBOutlet weak var loginBtnOutlet: UIButton!
    
    @IBOutlet weak var googleAccountSignIn: GIDSignInButton!
    @IBAction func googleSignInAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        print("Google .....")
        
        
    }

    @IBOutlet weak var googleLoginOutletBtn: UIButton!
    //
    //    @IBOutlet weak var googleSignInBtn: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Google Sign In /
        googleAccountSignIn.style = GIDSignInButtonStyle.iconOnly
        
        
        GIDSignIn.sharedInstance()?.clientID = "734287541282-h8v1ojlr4hm4fl26idajo1fu25lh9i51.apps.googleusercontent.com"//
        GIDSignIn.sharedInstance()?.delegate = self//
        
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
        
        
        
        //        if GIDSignIn.sharedInstance()?.currentUser != nil{
        //
        //        }else{
        //            GIDSignIn.sharedInstance()?.presentingViewController = self
        //        }
        //*******************//
        loginBtnOutlet.layer.cornerRadius=30
        loginBtnOutlet.layer.borderColor=UIColor.white.cgColor
        loginBtnOutlet.layer.borderWidth=2
        
        
        // to enable return key
        emailTextView.delegate=self
        passWordTextView.delegate=self
        //
        
        // to enable hide key board when touching any where
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        activityIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        activityIndicator.hide()
        
        
        
        
        googleLoginOutletBtn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        googleLoginOutletBtn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        googleLoginOutletBtn.layer.shadowOpacity = 1.0
        googleLoginOutletBtn.layer.shadowRadius = 0.0
        googleLoginOutletBtn.layer.masksToBounds = false
        googleLoginOutletBtn.layer.cornerRadius = 4.0
        
      
          googleAccountSignIn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
          googleAccountSignIn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
          googleAccountSignIn.layer.shadowOpacity = 1.0
          googleAccountSignIn.layer.shadowRadius = 0.0
          googleAccountSignIn.layer.masksToBounds = false
          googleAccountSignIn.layer.cornerRadius = 4.0
    }
    //  function to enable dimiss key board(Return key)
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    // function to enable dimiss key board(touch any where )
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        
        
        
        if (emailTextView.text?.isEmpty == false && passWordTextView.text?.isEmpty == false){
            var loginPresenter : LoginPresenter = LoginPresenter(loginViewRef: self)
            loginPresenter.checkUser(email: emailTextView.text!, password: passWordTextView.text!)
            //  Login code
        }
        else{
            
            //show Alert Here .... empty fileds
            Alert.showSimpleAlert(title: "sorry".localized, message: "Please Fill Required Fields", viewRef: self)
            
        }
    }
    
    
    
    @IBAction func resetPassword(_ sender: Any) {
        
        let resetPassPopup = (
            storyboard?.instantiateViewController(
                withIdentifier: "resetPopUpTV"))!
        present(resetPassPopup, animated: true, completion: nil)
    }
    
    @IBAction func goToSignupSB(_ sender: Any) {
        
        let signup = (
            storyboard?.instantiateViewController(
                withIdentifier: "signupSVC"))!
        
        present(signup, animated: true, completion: nil)
        
    }
    
    
    
    
    //     func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
    //        //      // ...
    //        //      if let error = error {
    //        //        // ...
    //        //        return
    //        //      }
    //        //
    //        //          print("The User Signed In Successfullt With Google ")
    //        //
    //        //          guard  ((user.profile?.email) != nil)  else {
    //        //              return
    //        //          }
    //        //          print("The User Email : \( user.profile.email ?? "No Email")")
    //        //      guard let authentication = user.authentication else { return }
    //        //      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
    //        //                                                        accessToken: authentication.accessToken)
    //        //      // ...
    //                if let error = error {
    //                print(error.localizedDescription)
    //                return
    //                }
    //                guard let auth = user.authentication else { return }
    //                let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
    //                Auth.auth().signIn(with: credentials) { (authResult, error) in
    //                if let error = error {
    //                print(error.localizedDescription)
    //                } else {
    //                print("Login Successful.")
    //                    guard  ((user.profile?.email) != nil)  else {
    //                                  return
    //                              }
    //
    //                        let user: GIDGoogleUser = GIDSignIn.sharedInstance()!.currentUser
    //                        let fullName = user.profile.name
    //                        let email = user.profile.email
    //                    var userDP:String?
    //                        if user.profile.hasImage {
    //                            userDP = String(describing : user.profile.imageURL(withDimension: 200))
    //                            print("User Image :\(String(describing: userDP))")
    //                        }
    //
    //                    SignupModel.addNameToFireStore(username: user.profile.name, id: user.userID)
    //
    //                    SignupModel.saveToRealm(id:  user.userID, username: user.profile.name)
    //                    RealTime().addUser(id:  user.userID, email: user.profile.email, birthdate:"", gender: "", phone:[Phone()], insurance: "", address:Address() , imagePath: userDP ?? "", name: user.profile.name)
    //    //
    //                    self.userValidation()
    //
    //    //                self.dismiss(animated: true, completion: nil)
    //
    //                //This is where you should add the functionality of successful login
    //                //i.e. dismissing this view or push the home view controller etc
    //                }
    //
    //
    //                }}
    //
    //            func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
    //                // Perform any operations when the user disconnects from app here.
    //                // ...
    //            }
    //
    
    
    
    //
    //        @available(iOS 9.0, *)
    //        func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
    //          -> Bool {
    //          return GIDSignIn.sharedInstance().handle(url)
    //        }
    //
    //        //For your app to run on iOS 8 and older, also implement the deprecated
    //        func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    //            return GIDSignIn.sharedInstance().handle(url)
    //        }
    
    
}


extension LoginTableViewController : GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        //      // ...
        //      if let error = error {
        //        // ...
        //        return
        //      }
        //
        //          print("The User Signed In Successfullt With Google ")
        //
        //          guard  ((user.profile?.email) != nil)  else {
        //              return
        //          }
        //          print("The User Email : \( user.profile.email ?? "No Email")")
        //      guard let authentication = user.authentication else { return }
        //      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
        //                                                        accessToken: authentication.accessToken)
        //      // ...
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login Successful.")
                self.dismiss(animated: true, completion: nil)
                guard  ((user.profile?.email) != nil)  else {
                    return
                }
                
                let user: GIDGoogleUser = GIDSignIn.sharedInstance()!.currentUser
                let fullName = user.profile.name
                let email = user.profile.email
                var userDP:String?
                if user.profile.hasImage {
                    userDP = String(describing : user.profile.imageURL(withDimension: 200)!)
                    print("User Image :\(userDP)")
                }
                
                let realm = try! Realm()
                
                
             //   let scope = realm.objects(Person.self).filter("id == %@", user.userID)
                 let scope = realm.object(ofType: Person.self, forPrimaryKey: user.userID)
                if scope == nil {
                    SignupModel.addNameToFireStore(username: user.profile.name, id: user.userID)
                    
                    SignupModel.saveToRealm(id:  user.userID, username: user.profile.name)
                    RealTime().addUser(id:  user.userID, email: user.profile.email, birthdate:"", gender: "", phone:[Phone()], insurance: "", address:Address() , imagePath: userDP! ?? "", name: user.profile.name)
                }
                
                
                
                // self.userValidation()
                
                // self.dismiss(animated: true, completion: nil)
                
                //This is where you should add the functionality of successful login
                //i.e. dismissing this view or push the home view controller etc
                
            }
            
            
        }}
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    
}


