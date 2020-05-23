//
//  BranchDescriptionViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class BranchDescriptionViewController: UIViewController , UIScrollViewDelegate {
 
    var branchDesc : IBranchDescModel!
    
    @IBOutlet weak var myLabel: UILabel!
    //  let eighthCell : EighthStaticTableViewCell! = nil
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var branchDescriptionTableView: UITableView!
    @IBOutlet var headerViewHeight: NSLayoutConstraint!
    let imageViewMaxHeight : CGFloat = 250
      let imageViewMinHeight : CGFloat = 100
    
    
    @IBOutlet var labImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.headerViewHeight.constant = self.imageViewMaxHeight
      
            
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.branchDescriptionTableView.delegate = self
        self.branchDescriptionTableView.dataSource = self
        myLabel.alpha = 0
        myLabel.text = "EL-Borg"
        branchDesc = BranchDescModel()
              branchDesc.fetchBranchDesc()
                  
    

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
