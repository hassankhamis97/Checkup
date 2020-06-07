//
//  ReviewsTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SDWebImage
class ReviewsTableViewController: UITableViewController , IReviewsView{
   
    var reviewPresenterInView : IReviewsPresenter!
    var reviewObjInView : [Review]!

    var reviewParam : ReviewsParams!
    var reviewBranchId : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewParam = ReviewsParams()
        reviewPresenterInView = ReviewsPresenter(view: self)
        
        reviewParam.take = 5
        reviewParam.skip = 0
    //    reviewParam.branchId = reviewBranchId
        print("review BranchID \(reviewBranchId)")
          reviewParam.branchId = "2"
        reviewPresenterInView.getReviewsDataFromModel(reviewParam: reviewParam)

        
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

        
        cell.viewOutlet.layer.shadowPath =  UIBezierPath(rect: cell.bounds).cgPath
        cell.viewOutlet.layer.shadowRadius = 4
        cell.viewOutlet.layer.shadowOffset = .zero
        cell.viewOutlet.layer.shadowOpacity = 0.05
        cell.viewOutlet.layer.cornerRadius = 5
        cell.viewOutlet.layer.borderWidth = 5
        cell.viewOutlet.layer.borderColor = UIColor.white.cgColor
        
        
        cell.userImageOutlet.layer.cornerRadius = 10
        
        
        
        cell.reviewsDateOutlet.sizeToFit()
        cell.descriptionOutlet.sizeToFit()
        
    
        cell.ratingOutlet.rating = reviewObjInView[indexPath.row].rateNumber!
        cell.reviewsDateOutlet?.text =  reviewObjInView[indexPath.row].date!
        cell.descriptionOutlet.text = reviewObjInView[indexPath.row].description ?? "no review"
        cell.userNameOutlet.text = reviewObjInView[indexPath.row].nickname!
        cell.userImageOutlet.sd_setImage(with: URL(string: reviewObjInView[indexPath.row].photoUrl!), placeholderImage:UIImage(named: "placeholder.png"))
        
           



        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }
    

    
    func returnDataToView(reviewsObj: [Review]) {
        
        print("reviews in view \(reviewObjInView)")
        if(reviewParam.skip == 0){
            reviewObjInView = reviewsObj
            print(reviewsObj.count)
        }else{
            for index in 1..<reviewsObj.count{
                reviewObjInView.append(reviewsObj[index])
            }
            
        }
        
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == (reviewObjInView!.count-1)){
            print("last cell is here")
            reviewParam.take = 5
            reviewParam.skip = reviewObjInView.count-1
            reviewPresenterInView.getReviewsDataFromModel(reviewParam: reviewParam)
        }
    }
    
    

}
