//
//  ResultDetailsTableViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import StepIndicator
import FirebaseAuth
class ResultDetailsTableViewController: UITableViewController{
    

    @IBOutlet var progressBarView: StepIndicatorView!
    
    @IBOutlet var pdfCollectionView: UICollectionView!
    @IBOutlet var resultTimeTextView: UILabel!
    @IBOutlet var resultDateTextView: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    var testID :String!
    var testObj : Test!
    var isNotified: Bool!
    var pdfCounter : Int!
    var pdfAndOpenDict =  [String : Bool]()
    var dict = [String : Dictionary<String, Any>]()
    var idAndDict = [String:Dictionary<String, Any>]()
    override func viewWillAppear(_ animated: Bool) {
        if(Auth.auth().currentUser?.uid == nil)
        {
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginSVC") as! LoginTableViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfCounter = 0
        
        if Locale.current.languageCode == "ar"
        {
            progressBarView.direction = StepIndicatorViewDirection(rawValue: 1)!
        }
        let requesStatusPresenter : RequestStatusPresenter = RequestStatusPresenter(requestViewRef : self)
        requesStatusPresenter.getRequest(testId: testID)
       
        
        
    }
    @IBAction func showDetailsAction(_ sender: UIButton) {
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        // constant :
        if indexPath.row==0{
            
            return 113
        }
        
        if indexPath.row==1{
            
            return 340
        }
        
        if indexPath.row==2{
            
            return 100
        }
        if indexPath.row==3{
            return 202
        }
        
        return tableView.rowHeight
    }

    
    func saveDataInUserDefault(counter : Int) {
        UserDefaults.standard.set(counter, forKey: "pdfCounter")
    }
    
    func retrieveDataFromUserDefault() -> Int {
      return  UserDefaults.standard.integer(forKey: "pdfCounter")
    }
    
 /*
    func saveDic(dictionary : Dictionary<Int64, Any>) {
        UserDefaults.standard.set(dictionary , forKey: "dictionary")
     }
     
  func retrieveDic() -> Dictionary<Int64,Any>{
    
    return ((UserDefaults.standard.object(forKey: "dictionary") as? Dictionary<Int64, Any>)!)
    }
    
    */
    

//(UserDefaults.standard.value(forKey: "dictionary") as? [Int64:Any])!
//(UserDefaults.standard.dictionary(forKey: "dictionary") as! [Int64:Any]?)!


    func saveDictionary(dict:[String : Dictionary<String , Any>], key: String){

    let userDefaults = UserDefaults.standard
    userDefaults.set(dict, forKey: key)

    // Read/Get Dictionary
 }
    func getDictionary(key: String) ->  [String : Dictionary<String , Any>]?{


    let userDefaults = UserDefaults.standard
    let strings = userDefaults.object(forKey: key)

    
    return strings as? [String : Dictionary<String , Any>]
        
    }
 
/*
 let contactDictionary = ["A":[Contact(name: "Annabel",phone: "000")]]

 let encodedData = NSKeyedArchiver.archivedData(withRootObject: contactDictionary)
 UserDefaults.standard.set(encodedData, forKey: "contactDictionary")

 if let data = UserDefaults.standard.data(forKey: "contactDictionary") {
     print("yep")
     let contactDictionary2 = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String : [Contact]]
 }
 else{
     print("nope")
 }
 */
}
