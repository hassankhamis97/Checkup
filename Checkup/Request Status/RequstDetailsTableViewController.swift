//
//  RequstDetailsTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/10/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import ImageSlideshow
class RequstDetailsTableViewController: UITableViewController {

    @IBOutlet weak var slideShow: ImageSlideshow!
    @IBOutlet weak var collectionView: UICollectionView!
     var pageControl = UIPageControl()
    var imageArray:[UIImage]!
    var testTextArray=["TSH","CBC","HbA1-c"]
    var x=0;
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       slideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
              slideShow.contentScaleMode = .scaleToFill
             
            
             pageControl.currentPageIndicatorTintColor = UIColor.black
             pageControl.pageIndicatorTintColor = UIColor.gray
             slideShow.pageIndicator = pageControl
             
             slideShow.activityIndicator = DefaultActivityIndicator()
             slideShow.delegate = self
             
                 
                 slideShow.setImageInputs([
                     ImageSource(image: UIImage(named: "rosheta")!),ImageSource(image: UIImage(named: "new rosheta")!)]
    
                 )
                 
    
        if #available(iOS 13.0, *) {
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(RequstDetailsTableViewController.didTap))
            
                 slideShow.addGestureRecognizer(recognizer)
                  tableView.reloadData()
        } else {
            // Fallback on earlier versions
        }
      
}
    @objc func didTap() {
           let fullScreenController = slideShow.presentFullScreenController(from: self)
           // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
           fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
       }
    
  
}




extension RequstDetailsTableViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int){
        print("current page:", page)
    }
}

extension RequstDetailsTableViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
               
               cell.testCell.text=testTextArray[indexPath.item]
               cell.layer.cornerRadius=8
               cell.layer.borderColor=UIColor.white.cgColor
              
               return cell
    }
    

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 1
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 2
    
            return testTextArray.count
   
    
 
 
}

}
  

