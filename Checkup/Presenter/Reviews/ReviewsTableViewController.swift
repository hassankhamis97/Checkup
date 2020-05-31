//
//  ReviewsTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ReviewsTableViewController: UITableViewController , IReviewsView{
   
    var reviewPresenterInView : IReviewsPresenter!
    var reviewObjInView : [Review]!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        reviewPresenterInView = ReviewsPresenter(view: self)
        reviewPresenterInView.getReviewsDataFromModel()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(reviewObjInView != nil){
            return reviewObjInView!.count
        }else
        {
            return 0
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewsCell", for: indexPath) as! mainReviewsTableViewCell

        // Configure the cell...
        cell.viewOutlet.layer.shadowPath =  UIBezierPath(rect: cell.bounds).cgPath
        cell.viewOutlet.layer.shadowRadius = 5
        cell.viewOutlet.layer.shadowOffset = .zero
        cell.viewOutlet.layer.shadowOpacity = 0.05
        cell.viewOutlet.layer.cornerRadius = 5
        cell.viewOutlet.layer.borderWidth = 5
        cell.viewOutlet.layer.borderColor = UIColor.white.cgColor
        
        
        if(reviewObjInView != nil){
            cell.ratingOutlet.rating = Double(reviewObjInView[indexPath.row].rateNumber!)
                   
           cell.reviewsDateOutlet?.text =  reviewObjInView[indexPath.row].date!
                
           //cell.descriptionOutlet.text = reviewObjInView[indexPath.row].description!
        }else
        {
            print("error")
        }
        
        
      //  cell.ratingOutlet.rating = Double(reviewObjInView[indexPath.row].rateNumber!)
        
   //     cell.reviewsDateOutlet?.text =  reviewObjInView[indexPath.row].date!
        
     //   cell.descriptionOutlet.text = reviewObjInView[indexPath.row].description!
        

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    

    
    func returnDataToView(reviewsObj: [Review]) {
        reviewObjInView = reviewsObj
            print("reviews in view \(reviewObjInView)")
        tableView.reloadData()
        
    }
    
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
