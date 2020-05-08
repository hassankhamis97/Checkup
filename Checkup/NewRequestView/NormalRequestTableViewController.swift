//
//  NormalRequestTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import ImageSlideshow
import SkyFloatingLabelTextField
import OpalImagePicker

@available(iOS 13.0, *)
class NormalRequestTableViewController: UITableViewController ,OpalImagePickerControllerDelegate,fillDataCells {
    
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    @IBOutlet weak var uploadImage: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var enterTestTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var enterDateTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var enterTimeTextField: SkyFloatingLabelTextFieldWithIcon!
  
       var testTexts=[String]()
       var pageControl = UIPageControl()
       var inputImageArray=[InputSource]()
       var imagePicker: ImagePicker!
  

    override func viewDidLoad()
    {
        super.viewDidLoad()

 self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
           
           
           //            slideShow.slideshowInterval = 5.0
           slideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
           slideShow.contentScaleMode = UIViewContentMode.scaleAspectFill
           
          
           pageControl.currentPageIndicatorTintColor = UIColor.lightGray
           pageControl.pageIndicatorTintColor = UIColor.black
           slideShow.pageIndicator = pageControl
           
           slideShow.activityIndicator = DefaultActivityIndicator()
           slideShow.delegate = self
           
           if (inputImageArray.count==0){
               
               slideShow.setImageInputs([
                   ImageSource(image: UIImage(named: "default")!),
                   ImageSource(image: UIImage(named: "default")!),
               ])
               
           }

           let recognizer = UITapGestureRecognizer(target: self, action: #selector(NormalRequestTableViewController.didTap))
           slideShow.addGestureRecognizer(recognizer)
           tableView.reloadData()
       }
       
    
    // delegate method
    func fillData(dataObj:String) {
           testTexts.append(dataObj)
           collectionView.reloadData()
       }
    
    
    
    //button method:
    
    @IBAction func uploadImageBtn(_ sender: Any) {
          
          
          let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
          
          alert.addAction(UIAlertAction(title: "Take Photo", style: .default , handler:{ (UIAlertAction)in
              print("User click Approve button")
              
              self.imagePicker.present(from: sender as! UIView)
              
          }))
          
          alert.addAction(UIAlertAction(title: "Choose Multiple Images ", style: .default , handler:{ (UIAlertAction)in
              let imagePicker = OpalImagePickerController()
              imagePicker.imagePickerDelegate = self
              self.present(imagePicker, animated: true, completion: nil)
          }))
          
          alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
              print("User click Dismiss button")
          }))
          
          self.present(alert, animated: true, completion: {
              print("completion block")
          })
          
          
      }
      
      @IBAction func removeImageBtn(_ sender: Any) {
          
          
      }
      
      @IBAction func addTestNameBtn(_ sender: Any) {
          
              let text=enterTestTextField.text
             if(text != "")
             {
                 testTexts.append(text!)
                 collectionView.reloadData()
                 enterTestTextField.text=""
              tableView.reloadData()
             }
             else{
                 let vc = self.storyboard?.instantiateViewController(identifier: "testNameGroupSVC") as! TestNamingGroupViewController
                 navigationController?.pushViewController(vc, animated: true)
                 vc.delegate=self
                     
        }
      }
      
      
      @IBAction func sendBtn(_ sender: Any) {
          
          // saving in database and navigate
      }

    
    
    // table hidden cell 
    override func tableView(_ tableView: UITableView,
                               heightForRowAt indexPath: IndexPath) -> CGFloat {


          if indexPath.row == 0 {
              return 322
          }

           if indexPath.row == 1 {

              if(testTexts.isEmpty)
              {
                  return 0
              }
              else{
                   return 82
              }
           }

          if (indexPath.row == 2||indexPath.row == 3||indexPath.row==4||indexPath.row==5||indexPath.row==6){

              return 80

          }

           return tableView.rowHeight
       }
      
    
    
    
    //pickers
    
       func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]){
           for img in images{
               
               
               var x=ImageSource(image: img)
                          
               inputImageArray.append(x)
               
           }
           
           slideShow.setImageInputs(inputImageArray)
           
           
           presentedViewController?.dismiss(animated: true, completion: nil)
           
       }
       
    
    @objc func didTap() {
        let fullScreenController = slideShow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    
      }
    
@available(iOS 13.0, *)
extension NormalRequestTableViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}



@available(iOS 13.0, *)
extension NormalRequestTableViewController: ImagePickerDelegate {

  func didSelect(image: UIImage?) {
    var x=ImageSource(image:image!)
    inputImageArray.append(x)
     slideShow.setImageInputs(inputImageArray)
    
  }
}

@available(iOS 13.0, *)
extension NormalRequestTableViewController:UICollectionViewDelegate,UICollectionViewDataSource{
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
        cell.layer.cornerRadius=15
        cell.layer.borderColor=UIColor.white.cgColor
        cell.deleteBtn.tag=indexPath.item
        cell.deleteBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return cell
        
    }
    
    @objc func buttonPressed(_ sender: UIButton)
   {
       print("buttonPressed ! \(sender.tag)")
    testTexts.remove(at: sender.tag)
    collectionView.reloadData()
   }
    
    
}






