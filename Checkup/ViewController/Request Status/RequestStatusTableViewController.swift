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
import SDWebImage
import SkyFloatingLabelTextField
class RequestStatusTableViewController: UITableViewController {
    var stepIndecatorShow : CGFloat = 100;
    @IBOutlet weak var precautionsText: UITextView!
    var testStatusObj :Test!
    var imgSlider : CGFloat = 0
    var testArrTite :CGFloat = 0
    var testArrContent : CGFloat = 0
               
    @IBOutlet weak var costText: UILabel!
   
    @IBOutlet weak var resultDateText: UILabel!
    @IBOutlet weak var resultTimeText: UILabel!
    
    @IBAction func showEmpDetailsBtn(_ sender: Any) {
        var empDetails =  self.storyboard?.instantiateViewController(withIdentifier: "EMPDETAILS") as! PopUpTableViewController
        guard let empID = self.testStatusObj.employeeId else {
            return
        }
        empDetails.employeeID = empID
        
        self.present(empDetails, animated: true, completion: nil)
        
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var empDetails =  self.storyboard?.instantiateViewController(withIdentifier: "EMPDETAILS") as! PopUpTableViewController
//                guard let empID = self.testStatusObj.employeeId else {
//                    return
//                }
//                empDetails.employeeID = empID
//        
//    
//    }
    
    
    @IBOutlet weak var sampleTime: UILabel!
    @IBOutlet weak var sampleDate: UILabel!
    
    @IBOutlet weak var codeText: UILabel!
    @IBOutlet weak var locationTextArea: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var timeTextArea: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var dateTextArea: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var precautionsTextArea: UITextView!
    
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    /// ***********   Cancel Request Btn ********* //
    @IBAction func cancelRequestBtn(_ sender: Any) {
        print("cancel taped ")
        
        let alert = UIAlertController(title: "Confirmation Message", message: "Do you want to cancel this request ?", preferredStyle: .alert)

      

        self.present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            print("You choosed Yes !")
            
            var fullDateTimeString = ("\(self.testStatusObj.dateForTakingSample) \(self.testStatusObj.timeForTakingSample)")
           if self.canCancelRequest(requestDateTime:fullDateTimeString)
           {
            
           }else {
            
            
                  let alert = UIAlertController(title: "Confirmation Message", message: "Sorry You can't cancel this request we are about to take your ssample now if you insest please call the laboratory ?", preferredStyle: .alert)

                

                  self.present(alert, animated: true)
            
            
            }
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
                  print("You choosed NOoOo !")
              }))
        
    }
    
    var pageControl = UIPageControl()
    var imageArray:[UIImage]!
    //var testTextArray=["TSH","CBC","HbA1-c"]
    var testTextArray : [String] = []
    var savedImageArray=[UIImage]() // coming from data base
    var slidShowImageArray=[InputSource]()// converted savedImage
    var x=0; // will be deleted just for testing confirmation and refusing state
    
    
    @IBOutlet weak var progressBarView: StepIndicatorView!
    
    
     // those two button will be deleted
//    @IBAction func confirmBtn(_ sender: Any) {
//
//        x=3
//        progressBarView.currentStep=1
//        tableView.reloadData()
//
//    }
    ////***********************/
  
    
    @IBAction func showRequestDetailsBtn(_ sender: Any) {
        
        x = 1
               stepIndecatorShow = 0
               
               self.dateTextArea.text = self.testStatusObj.dateRequest
                                self.timeTextArea.text = self.testStatusObj.timeRequest
                                let location = "\( self.testStatusObj.address!.buildingNo!)  \(self.testStatusObj.address!.apartmentNo!)     \(self.testStatusObj.address!.floorNo!)"
                                   
                                self.locationTextArea.text = location
               
               tableView.reloadData()
    }
    //    @IBAction func refuseBtn(_ sender: Any) {
//        x=5
//        progressBarView.lineTintColor=UIColor.red
//        tableView.reloadData()
//    }
    
    
    ////////// refused ///////////////////
    
    
    @IBOutlet weak var refuseReasonText: UILabel!
    
    
    @IBOutlet weak var refuseDescriptionText: UITextView!
    
    @IBAction func deleteRefusedRequestBtn(_ sender: Any) {
        
    }
    
    
    ///////////////////////// 585 //////////////////////////
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        ///*********************////
        testStatusObj = Test();
               
               var requesStatusPresenter : RequestStatusPresenter = RequestStatusPresenter(requestViewRef : self)
               requesStatusPresenter.getRequest(labId: "-M7PRbF7mxbUJ0mdP4vH", branchId: "0G9djW7SzMXGTiXKdGkiYuiTY3g1", id: "-M7T-mc9zrSii2vWJ9zE")
        //-M7T-mc9zrSii2vWJ9zE *****  -M7T0G0OLT8h5zPdV0AN   ---- -M7T1XRN8LiaLBI9D2XS
        // refused -M7T1XRN8LiaLBI9D2XS  -- result -M7T0YuvqO4XbT-iAkOZ
         progressBarView.currentStep=0
        x=0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//          let realObj = RealTime()
        
//        let addr = Address(buildingNo:"100" ,floorNo:"3" ,apartmentNo:"3",
//                           longitude:"150.95",latitude:"80.45")
//
//
//        realObj.addTest(userId: "-M5sNybXk09dmQ6gx443", testName: ["CBC","HNNO"], resultFilespaths: [], roushettaPaths: [""], description: " i need full check on my body ya ma3mal", isFromHome: "true", dateRequest: "15 june, 2020", timeRequest: "06:00AM", dateForTakingSample: "", timeForTakingSample: "", dateResult:"", timeResult: "", branchId: "0G9djW7SzMXGTiXKdGkiYuiTY3g1", labId: "-M7PRbF7mxbUJ0mdP4vH", address: addr, hba1c: "", status: "Refused", isNotified: "", totalCost: "", precautions: "", employeeId: "", radioReason: " ", refuseReason: "", generatedCode: "")
        
       
        x=0
        
        
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
          */
        
        slideShow.setImageInputs(slidShowImageArray)
        
      
       // slideShow.setImageInputs([ImageSource(image: UIImage(named: "rosheta")!),ImageSource(image: UIImage(named: "new rosheta")!)])
        
        
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
            
            return stepIndecatorShow
        }
        
//        if indexPath.row==1{
//
//                   return 52
//               }
        
        if indexPath.row==14{
            return 30
        }
        
       //
        if (x==0){
            
            if (indexPath.row==0 || indexPath.row == 1 || indexPath.row==2 || indexPath.row==3 || indexPath.row==4 || indexPath.row==5 ||  indexPath.row==7  || indexPath.row==8  || indexPath.row==9  || indexPath.row==10  || indexPath.row==11 ||  indexPath.row==12  || indexPath.row==13 || indexPath.row==14){
                             return 0
                         }
                  
                  
//                  if indexPath.row==6{
//                      return 220
//                  }
//
//                  if indexPath.row==7{
//                             return 50
//                         }
//                  if indexPath.row==8{
//                             return 80
//                         }
//
//                  if (indexPath.row==9 || indexPath.row==10 || indexPath.row==11){
//                             return 70
//                         }
//                  if indexPath.row==12{
//                             return 50
//                         }
//                  if indexPath.row==13{
//                              return 20
//                  }
//
        }
        
        
        if (x==1){
                   
                   if (indexPath.row==1 || indexPath.row==2 || indexPath.row==3 || indexPath.row==4 || indexPath.row==5  || indexPath.row==13 ){
                                    return 0
                                }
                         
                      
                         if indexPath.row==6{
                             return imgSlider
                         }
                         
                         if indexPath.row==7{
                                    return testArrTite
                                }
                         if indexPath.row==8{
                                    return testArrContent
                                }
                         
                         if (indexPath.row==9 || indexPath.row==10 || indexPath.row==11){
                                    return 70
                                }
                         if indexPath.row==12{
                                    return 50
                                }
                         if indexPath.row==14{
                                     return 20
                         }
                   
               }
              
        
        ////////////////*************** show Request Details  ******************
//
//        if (x==7){
//
//            if (indexPath.row==0 || indexPath.row==1 || indexPath.row==2 || indexPath.row==3 || indexPath.row==4 || indexPath.row==5 ){
//                             return 0
//                         }
//
//
//                  if indexPath.row==6{
//                      return imgSlider
//                  }
//
//                  if indexPath.row==7{
//                             return testArrTite
//                         }
//                  if indexPath.row==8{
//                             return testArrContent
//                         }
//
//                  if (indexPath.row==9 || indexPath.row==10 || indexPath.row==11){
//                             return 70
//                         }
//                  if indexPath.row==12{
//                             return 50
//                         }
//                  if indexPath.row==13{
//                              return 20
//                  }
//
//        }
//
        /*****************************/
        
        
        if (x==3){ //in case of confirmed
            
            if (indexPath.row==4 || indexPath.row==5 || indexPath.row==6 || indexPath.row==7 || indexPath.row==8 || indexPath.row==9 || indexPath.row==10 || indexPath.row==11 || indexPath.row==12 || indexPath.row==13 ){
                             return 0
                         }
                  if indexPath.row==1{
                  
                                     return 52
                                 }
                  
                  if indexPath.row==2{
                      return 455
                  }
                  
                  if indexPath.row==3{
                             return 52
                         }
  
        }
    
        
        if (x==5){ // in case of refusing
                   
            if (indexPath.row==2  || indexPath.row==3  || indexPath.row==6  || indexPath.row==7  || indexPath.row==8  || indexPath.row==9  || indexPath.row==10 || indexPath.row==11 || indexPath.row==12 || indexPath.row==13){
                                    return 0
                                }
                         if indexPath.row==1{
                         
                                            return 52
                                        }
                         
                         if indexPath.row==4{
                             return 296
                         }
                         
                         if indexPath.row==5{
                                    return 52
                                }
                 
               }
        if (x==7){ // in case of refusing
                         
                  if (indexPath.row==2  || indexPath.row==3 || indexPath.row==4 || indexPath.row==5  || indexPath.row==6  || indexPath.row==7  || indexPath.row==8  || indexPath.row==9  || indexPath.row==10 || indexPath.row==11 || indexPath.row==12 ){
                                          return 0
                                      }
                               if indexPath.row==1{
                               
                                                  return 52
                                              }
                               
                               if indexPath.row==13{
                                   return 250
                               }
                               
                       
                       
                     }
             
              return tableView.rowHeight
          }
         
    
    
    
    
    
    
    }

    extension RequestStatusTableViewController: ImageSlideshowDelegate {
        func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int){
    
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
      


    
    

extension RequestStatusTableViewController : IRequestStatusView
{
    
      
    func canCancelRequest(requestDateTime : String )->Bool
    {
        var isOk = false ;
      // let dateAsString = "02/12/15, 16:48"
//      let  datee = "May 20, 2020"
//      let time = "05:30 PM"
//      let requestDateTimeStr = "\(datee) \(time)"
      
      let formatter = DateFormatter()
      formatter.dateStyle = .medium
      formatter.timeStyle = .medium
      
      formatter.dateFormat = "MMM dd, yyyy hh:mm a"
      let requestDateTime = formatter.date(from:requestDateTime)
      
      let now = Date()
      print(now)
      let datePlus3Hours = Calendar.current.date(byAdding: .hour, value: 3, to: now)!
      
      
      print(datePlus3Hours)
      print(requestDateTime!)
      if requestDateTime! >= datePlus3Hours
      {
        isOk = true;
          print(" hello  \(requestDateTime!) ")
      }
      
      

        return isOk;
    }
    
    
    
    
    
    
    func onReceiveRequestStatus(myObj:Test) {
                print("*************************")
            
       
        
        if let imgArr = myObj.roushettaPaths {
            if imgArr[0] != nil && imgArr[0] != "" {
             loadImage(imageArray: imgArr)
                imgSlider = 220}
        }
           
        if let testArr = myObj.testName {
              if testArr[0] != nil && testArr[0] != "" {
           testTextArray = myObj.testName!

            testArrTite = 50
            testArrContent = 80
            }
    
        }
           
        

        self.testStatusObj = myObj
      
        print("*************************")
        if myObj.status == "PendingForLabConfirmation"
        {
            self.x=1
             progressBarView.currentStep=0
            
                        
            self.dateTextArea.text = myObj.dateRequest
                  self.timeTextArea.text = myObj.timeRequest
                  let location = "\( myObj.address!.buildingNo!)  \(myObj.address!.apartmentNo!)     \(myObj.address!.floorNo!)"
                     
                  self.locationTextArea.text = location
            
        }
         else
        if myObj.status == "PendingForTakingTheSample"
        {

            self.x=3
            
            progressBarView.currentStep=1
            self.codeText.text = myObj.generatedCode
            self.sampleDate.text = myObj.dateForTakingSample
            self.sampleTime.text = myObj.timeForTakingSample
            self.precautionsText.text = myObj.precautions
            self.costText.text = myObj.totalCost
            
            
        }else if myObj.status == "PendingForResult"
        {
            self.x=7
            progressBarView.currentStep=2
            self.codeText.text = myObj.generatedCode
                       self.resultDateText.text = myObj.dateResult
                       self.resultTimeText.text = myObj.timeResult
                    
                      // self.costText.text = myObj.totalCost
            
        }
        else if myObj.status == "Refused"
        {
             self.codeText.text = myObj.generatedCode
            self.refuseReasonText.text = myObj.refuseReason
            self.refuseDescriptionText.text = myObj.description
            
                     x=5
              progressBarView.currentStep=1
                     progressBarView.lineTintColor=UIColor.red
                     tableView.reloadData()
                
        }
        
        self.tableView.reloadData()
                      self.collectionView.reloadData()
    }
    
     func loadImage(imageArray:[String]) {
    
       var count = 0
       
    let downloader = SDWebImageManager()
       
    for url in imageArray{

     downloader.imageDownloader?.downloadImage(with: URL(string: url), options: .highPriority, progress: {
             (receivedSize, expectedSize, url) in
             // image is being downloading and you can monitor progress here
                 }, completed: { (downloadedImage, data, error, success) in
                     print(downloadedImage, data, success)
                     //image is downloaded and ready to use
                   let i=ImageSource(image:downloadedImage!)
                   self.slidShowImageArray.append(i)
                     count += 1
                  if count >= imageArray.count{
                  self.slideShow.setImageInputs(self.slidShowImageArray)
                 
                  }
                   
                 })
            
                  }
      
        }
    

    
}


