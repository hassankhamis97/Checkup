//
//  newRequestTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import OpalImagePicker
import SwiftCheckBox
import ImageSlideshow

class newRequestTableViewController: UITableViewController,OpalImagePickerControllerDelegate {

  
    @IBOutlet weak var checkBoxBtn: CheckBoxButton!
    
    
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    

    
     var TestImgs=[UIImage]()

    
    var input=[InputSource]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
     
        
            }

 
    
     override func viewWillAppear(_ animated: Bool) {
        
        
            slideShow.slideshowInterval = 5.0
                    slideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
                    slideShow.contentScaleMode = UIViewContentMode.scaleAspectFill

                    let pageControl = UIPageControl()
                    pageControl.currentPageIndicatorTintColor = UIColor.lightGray
                    pageControl.pageIndicatorTintColor = UIColor.black
                    slideShow.pageIndicator = pageControl

                    slideShow.activityIndicator = DefaultActivityIndicator()
                    slideShow.delegate = self


        if (TestImgs.count==0){
            
              slideShow.setImageInputs([
                             ImageSource(image: UIImage(named: "default")!),
                             ImageSource(image: UIImage(named: "default")!),
                            ])

        }
       
        
        
        
        
        
                    let recognizer = UITapGestureRecognizer(target: self, action: #selector(newRequestTableViewController.didTap))
                    slideShow.addGestureRecognizer(recognizer)
        
        
          tableView.reloadData()
       
    }

    @IBAction func addImageBtn(_ sender: Any) {

let imagePicker = OpalImagePickerController()
imagePicker.imagePickerDelegate = self
present(imagePicker, animated: true, completion: nil)
        
    }
    

    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]){
    for img in images{
        
             
             TestImgs.append(img)
        
        
        
         }
        
        for img in TestImgs{
                      
                   
                   
                   var x=ImageSource(image: img)
                      
                   input.append(x)
                      
                       }
         slideShow.setImageInputs(input)
  
    
         presentedViewController?.dismiss(animated: true, completion: nil)

     }
    
    
    
           @objc func didTap() {
                let fullScreenController = slideShow.presentFullScreenController(from: self)
                // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
                fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
            }
        }

        extension newRequestTableViewController: ImageSlideshowDelegate {
            func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
                print("current page:", page)
            }
        }

        
        
        
        

       

    
/*

//extension newRequestTableViewController:UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        if (TestImgs.count>0)
//        {
//            return TestImgs.count
//        }
//
//        else{
//            return 1
//        }
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
//        if (TestImgs.count>0)
//            {
//               cell.image=TestImgs[indexPath.item]
//
//
//        }
////
//
//
//        return cell
//    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//          return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//      }
//
//
//  override  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        currentIndex = Int(scrollView.contentOffset.x / collectionView.frame.size.width)
//        pageControl.currentPage = currentIndex
//    }

    
//}
*/
