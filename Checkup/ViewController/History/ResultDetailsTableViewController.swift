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

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
