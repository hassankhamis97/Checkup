//
//  RequestStatusTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import  ImageSlideshow
import StepIndicator

class RequestStatusTableViewController: UITableViewController {
    
    @IBOutlet weak var precautionsTextArea: UITextView!
    
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var pageControl = UIPageControl()
    var imageArray:[UIImage]!
    var testTextArray=["TSH","CBC","HbA1-c"]
    var savedImageArray=[UIImage]() // coming from data base
    var slidShowImageArray=[InputSource]()// converted savedImage
    var x=0; // will be deleted just for testing confirmation and refusing state
    
    
    @IBOutlet weak var progressBarView: StepIndicatorView!
    
    
     // those two button will be deleted
    @IBAction func confirmBtn(_ sender: Any) {
        
        x=3
        progressBarView.currentStep=1
        tableView.reloadData()
          
    }
    
    
    @IBAction func refuseBtn(_ sender: Any) {
        x=5
        progressBarView.lineTintColor=UIColor.red
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        precautionsTextArea.layer.borderWidth=2
        precautionsTextArea.layer.cornerRadius=10
    precautionsTextArea.layer.borderColor=UIColor.darkGray.cgColor
        
        slideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
          slideShow.contentScaleMode = .scaleToFill
        
        
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        slideShow.pageIndicator = pageControl
        
        slideShow.activityIndicator = DefaultActivityIndicator()
        slideShow.delegate = self
        
       /* when dealing with Database
        for img in savedImageArray{
            
            var i=ImageSource(image:img)
            slidShowImageArray.append(i)
        }
        
        slideShow.setImageInputs(slidShowImageArray)
        
        */
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
   
        
                  progressBarView.currentStep=0
        
    }
    

    
    @objc func didTap() {
               let fullScreenController = slideShow.presentFullScreenController(from: self)
               // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
               fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
           }
    
    
    // to hide cell
    
    override func tableView(_ tableView: UITableView,
                                  heightForRowAt indexPath: IndexPath) -> CGFloat {
// constant :
        if indexPath.row==0{
            
            return 100
        }
        
        if indexPath.row==1{
                   
                   return 52
               }
        
        if indexPath.row==13{
            return 30
        }
        
       //
        if (x%2==0){
            
            if (indexPath.row==2 || indexPath.row==3 || indexPath.row==4 || indexPath.row==5 ){
                             return 0
                         }
                  
                  
                  if indexPath.row==6{
                      return 220
                  }
                  
                  if indexPath.row==7{
                             return 50
                         }
                  if indexPath.row==8{
                             return 80
                         }
                  
                  if (indexPath.row==9 || indexPath.row==10 || indexPath.row==11){
                             return 70
                         }
                  if indexPath.row==12{
                             return 50
                         }
                  if indexPath.row==13{
                      return 20
                  }
            
        }
        
        if (x==3){ //in case of confirmed
            
            if (indexPath.row==4 || indexPath.row==5 || indexPath.row==6 || indexPath.row==7 || indexPath.row==8 || indexPath.row==9 || indexPath.row==10 || indexPath.row==11 || indexPath.row==12 ){
                             return 0
                         }
                  
                  
                  if indexPath.row==2{
                      return 455
                  }
                  
                  if indexPath.row==3{
                             return 52
                         }
  
        }
        
        
        if (x==5){ // in case of refusing
                   
            if (indexPath.row==2 || indexPath.row==3 || indexPath.row==6 || indexPath.row==7 || indexPath.row==8 || indexPath.row==9 || indexPath.row==10 || indexPath.row==11 || indexPath.row==12 || indexPath.row==13){
                                    return 0
                                }
                         
                         
                         if indexPath.row==4{
                             return 296
                         }
                         
                         if indexPath.row==5{
                                    return 52
                                }
                   
                   
                   
                   
                   
               }
             
              return tableView.rowHeight
          }
         
    
    
    
    
    
    
    }

    extension RequestStatusTableViewController: ImageSlideshowDelegate {
        func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int){
            print("current page:", page)
        }
    }

    
    extension RequestStatusTableViewController:UICollectionViewDelegate,UICollectionViewDataSource{
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
      


    
    

