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

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class newRequestTableViewController: UITableViewController,OpalImagePickerControllerDelegate,fillDataCells {
    
    

    @IBOutlet weak var myCell: UITableViewCell!
    
  
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    
    @IBAction func addName(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "testNameGroupSVC") as! TestNamingGroupViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.delegate=self
        
    }
    
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    

    
     var TestImgs=[UIImage]()
    
    var testTexts=[String]()
    
    func fillData(dataObj:String) {
        testTexts.append(dataObj)
        collectionView.reloadData()
        //vc.delegete=self
        
    }
    
    
    
    var input=[InputSource]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
}
 
//   override func tableView(_ tableView: UITableView,
//                            heightForRowAt indexPath: IndexPath) -> CGFloat {
//    if indexPath.row == 1 && testTexts.isEmpty{
//            return 0
//        }
//
//        return tableView.rowHeight
//    }

    
    
     override func viewWillAppear(_ animated: Bool) {
        
        
//            slideShow.slideshowInterval = 5.0
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

@available(iOS 13.0, *)
extension newRequestTableViewController: ImageSlideshowDelegate {
            func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
                print("current page:", page)
            }
        }

        
        
        
        

       

    


@available(iOS 13.0, *)
extension newRequestTableViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 1
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 2
        if(testTexts.isEmpty)
        {
            return 0
        }
        else{
            return testTexts.count
        }
    }
    

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
    
    cell.testCell.text=testTexts[indexPath.item]
    cell.layer.borderWidth=2
    cell.layer.cornerRadius=10
   
    
        return cell
    }
    

    
}




