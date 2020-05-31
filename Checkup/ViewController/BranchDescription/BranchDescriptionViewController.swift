//
//  BranchDescriptionViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SDWebImage
class BranchDescriptionViewController: UIViewController , UIScrollViewDelegate , IBranchDescView , IReviewsView{
   
 
    var branchDescriptionView : BranchDescription!
    var branchDescPresenter : IBranchDescPresenter!
    
    var reviewPresenterInView : IReviewsPresenter!
    var reviewObjInView : [Review]!
    
    let imageViewMaxHeight : CGFloat = 250
    let imageViewMinHeight : CGFloat = 100
    
    @IBOutlet weak var myLabel: UILabel!
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var branchDescriptionTableView: UITableView!
    @IBOutlet var headerViewHeight: NSLayoutConstraint!
    @IBOutlet var labImageView: UIImageView!
    @IBOutlet weak var viewOutlet: UIView!
    
    
  
      
    override func viewWillAppear(_ animated: Bool) {
        self.headerViewHeight.constant = self.imageViewMaxHeight
      
            
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.branchDescriptionTableView.delegate = self
        self.branchDescriptionTableView.dataSource = self
        myLabel.alpha = 0
        branchDescPresenter = BranchDescPresenter(view: self)
        branchDescPresenter.getDataFromModel()
               
        //reviewPresenterInView = ReviewsPresenter(view: self)
        //reviewPresenterInView.getReviewsDataFromModel()
       
        
        viewOutlet.clipsToBounds = true
        viewOutlet.layer.cornerRadius = 40
       // viewOutlet.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
        viewOutlet.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
    

    }
 func showDataToView(barnchDescObjInView: BranchDescription) {
      branchDescriptionView =  barnchDescObjInView
    print("in branch description view \(branchDescriptionView )")
    print("view")
    myLabel.text = branchDescriptionView.labName!
    labImageView.sd_setImage(with: URL(string: branchDescriptionView.branchPhoto!), placeholderImage:UIImage(named: "placeholder.png"))
    print(branchDescriptionView.address?.longitude)
    branchDescriptionTableView.reloadData()

    
  }
 
    func returnDataToView(reviewsObj: [Review]) {
       //    reviewObjInView = reviewsObj
     //   print("reviews in view \(reviewObjInView)")
    
    }
       
    
     
  
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let y : CGFloat = scrollView.contentOffset.y
              let newHeaderHeight : CGFloat = headerViewHeight.constant-y
          
          if newHeaderHeight >= imageViewMaxHeight{
                  headerViewHeight.constant = imageViewMaxHeight
            labImageView.contentMode = .scaleToFill
            myLabel.alpha = 0
              }else if newHeaderHeight < imageViewMinHeight{
            labImageView.alpha = 0.1
                  headerViewHeight.constant = imageViewMinHeight
                myLabel.alpha = 1

              }else{
//
            labImageView.alpha = 1 - (((imageViewMaxHeight - newHeaderHeight)*(0.9)) / (imageViewMaxHeight - imageViewMinHeight))
            labImageView.contentMode = .scaleAspectFill
                  headerViewHeight.constant = newHeaderHeight
                  scrollView.contentOffset.y = 0
              }
    }

}

/**/
