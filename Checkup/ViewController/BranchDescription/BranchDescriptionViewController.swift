//
//  BranchDescriptionViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class BranchDescriptionViewController: UIViewController , UIScrollViewDelegate {

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

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let y : CGFloat = scrollView.contentOffset.y
              let newHeaderHeight : CGFloat = headerViewHeight.constant-y
          
          if newHeaderHeight >= imageViewMaxHeight{
                  headerViewHeight.constant = imageViewMaxHeight
            labImageView.contentMode = .scaleToFill
              }else if newHeaderHeight < imageViewMinHeight{
            labImageView.alpha = 0.1
                  headerViewHeight.constant = imageViewMinHeight
                
              }else{
//            if(imageViewMaxHeight - newHeaderHeight) < 0){
//
//            }
            labImageView.alpha = 1 - (((imageViewMaxHeight - newHeaderHeight)*(0.9)) / (imageViewMaxHeight - imageViewMinHeight))
            labImageView.contentMode = .scaleAspectFill
                  headerViewHeight.constant = newHeaderHeight
                  scrollView.contentOffset.y = 0
              }
    }

}
extension BranchDescriptionViewController: UITableViewDataSource, UITableViewDelegate {
  
    
 func numberOfSectionsInTableView(tableView: UITableView) -> Int {
 return 1
 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return 40
 }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell()
      cell.textLabel!.text = "Cell \(indexPath.row)"
      return cell
  }
}

