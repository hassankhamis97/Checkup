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
import SkyFloatingLabelTextField

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class newRequestTableViewController: UITableViewController,OpalImagePickerControllerDelegate,fillDataCells {
    
    @IBOutlet weak var myCell: UITableViewCell!
    @IBOutlet weak var uploadImag: UIButton!
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var enterTestTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    @IBOutlet weak var dateTextField: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var timeTextField: SkyFloatingLabelTextFieldWithIcon!
    var TestImgs=[UIImage]()
    var testTexts=[String]()
    var pageControl = UIPageControl()
    var input=[InputSource]()
    var imagePicker: ImagePicker!
    let datePicker=UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    
    createDatePicker()
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
    
    // Delegate Metoda For Navigation
    func fillData(dataObj:String) {
           testTexts.append(dataObj)
           collectionView.reloadData()
       }
    
    
    
    @IBAction func addTestTextBtn(_ sender: Any) {
           
           let text=enterTestTextField.text
           if(text != "")
           {
               testTexts.append(text!)
               collectionView.reloadData()
               enterTestTextField.text=""
           }
           else{
               let vc = self.storyboard?.instantiateViewController(identifier: "testNameGroupSVC") as! TestNamingGroupViewController
               navigationController?.pushViewController(vc, animated: true)
               vc.delegate=self
               
           }
           
           
       }
    
    @IBAction func addImageBtn(_ sender: Any) {
        
        
        
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
    
    
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]){
        for img in images{
            
            
            TestImgs.append(img)
            
            var x=ImageSource(image: img)
                       
            input.append(x)
            
        }
        
        slideShow.setImageInputs(input)
        
        
        presentedViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    
    func createDatePicker(){
        
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        let doneBtn=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:#selector(donePressed))
        toolbar.setItems(([doneBtn]), animated: true)
        dateTextField.inputAccessoryView=toolbar
        dateTextField.inputView=datePicker
        datePicker.datePickerMode = .date
        
    }
    
    @objc func didTap() {
        let fullScreenController = slideShow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    @objc func donePressed(){
           
           
           let formatter=DateFormatter()
           formatter.dateStyle = .medium
           formatter.timeStyle = .none
           dateTextField.text=formatter.string(from: datePicker.date)
           self.view.endEditing(true)
       }

}



@available(iOS 13.0, *)
extension newRequestTableViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}



@available(iOS 13.0, *)
extension newRequestTableViewController: ImagePickerDelegate {

  func didSelect(image: UIImage?) {
    TestImgs.append(image!)
    var x=ImageSource(image:image!)
    input.append(x)
     slideShow.setImageInputs(input)
    
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




