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
class ResultDetailsTableViewController: UITableViewController {

    @IBOutlet var progressBarView: StepIndicatorView!
    
    @IBOutlet var pdfCollectionView: UICollectionView!
    @IBOutlet var resultTimeTextView: UILabel!
    @IBOutlet var resultDateTextView: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    var testID :String!
    var testObj : Test!
    
    var pdfCounter : Int!
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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
   
}
