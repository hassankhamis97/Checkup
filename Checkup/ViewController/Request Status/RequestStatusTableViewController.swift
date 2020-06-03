//
//  RequestStatusTableViewController.swift
//  Checkup
//
//  Created by Mahmoud Abdul-Wahab on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import  ImageSlideshow
import StepIndicator
import SDWebImage
import Firebase
import SkyFloatingLabelTextField
class RequestStatusTableViewController: UITableViewController  {
    var stepIndecatorShow : CGFloat = 100;
    @IBOutlet weak var precautionsText: UITextView!
    var testID :String!
    var testStatusObj :Test!
    var imgSlider : CGFloat = 0
    var testArrTite :CGFloat = 0
    var testArrContent : CGFloat = 0
    var showCancel : CGFloat = 0
    var showDetailsPage = false ;
    var alertStatus : Int8 = 0 ;
    var isFromHomeCheck : Bool = true ;
    var locationCell:CGFloat = 0
    static var page: Int?
    @IBOutlet weak var costText: UILabel!
    
    @IBOutlet weak var employeeTitleText: UILabel!
    
    @IBOutlet weak var showRequestOutlet: UIButton!
    
    @IBAction func showEmpDetailsBtn(_ sender: Any) {
        
        
        if self.isFromHomeCheck == true{
            
            let empDetails =  self.storyboard?.instantiateViewController(withIdentifier: "EMPDETAILS") as! PopUpTableViewController
            guard let empID = self.testStatusObj.employeeId , let branchId = self.testStatusObj.branchId else {
                Alert.showAdvancedAlert(title: "STATUS_EMP_NOT_FOUND".localized, message: "STATUS_DELETE_CONFIRMATION".localized, viewAdvancedAlertRef: self)
                return
            }
            
            empDetails.employeeID = empID
            empDetails.branchID = branchId
            self.present(empDetails, animated: true, completion: nil)
            
            
        } else if isFromHomeCheck == false {
            // show lab description Page
              
            let branchDesc = self.storyboard!.instantiateViewController(withIdentifier: "branchDesc") as! BranchDescriptionViewController
            branchDesc.modalPresentationStyle = .fullScreen
           
            guard let labID = testStatusObj.labId else{
                return
            }
//             navigationController?.pushViewController(labDescriptionVC, animated: true)
         //   branchDesc.labId = labID ;
             self.present(branchDesc , animated: true , completion: nil)
        }
        
    }
    
    
    
    @IBOutlet weak var sampleTime: UILabel!
    @IBOutlet weak var sampleDate: UILabel!
    
    @IBOutlet weak var codeText: UILabel!
    @IBOutlet weak var locationTextArea: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var timeTextArea: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var dateTextArea: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var precautionsTextArea: UITextView!
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //    /// ***********   Cancel Request Btn ********* //
    //    func pressOk() {
    //           print("You choosed Yes !")
    //
    //            var fullDateTimeString = ("\(self.testStatusObj.dateForTakingSample!) \(self.testStatusObj.timeForTakingSample!)")
    //           if self.canCancelRequest(requestDateTime:fullDateTimeString)
    //           {
    //            let cancelrequestPresenter = CancelRequestPresenter(cancelRequestRef : self)
    //
    //            //var test = Test()
    //           // test.id = testStatusObj.id
    //
    //          //  test.status = "Canceled"
    //
    //            cancelrequestPresenter.cancelRequest(testObj: testStatusObj)
    //            //************ back **************/
    //
    //                    self.navigationController?.popViewController(animated: true)
    //           }else {
    //
    //
    //                  let alert = UIAlertController(title: "Confirmation Message", message: "Sorry You can't cancel this request we are about to take your sample now if you insest please call the laboratory ?", preferredStyle: .alert)
    //
    //
    //             alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
    //                              print("You choosed NOoOo !")
    //                         }))
    //                  self.present(alert, animated: true)
    //
    //
    //        }
    //       }
    //
    //       func pressCancel() {
    //
    //        print("You choosed NOoOo !")
    //
    //       }
    @IBAction func cancelRequestBtn(_ sender: Any) {
        print("cancel taped ")
        alertStatus = 0
        Alert.showAdvancedAlert(title: "STATUS_CONFIRMATION".localized, message: "STATUS_CANCEL_CONFIRMATION".localized, viewAdvancedAlertRef: self)
        
        //        let alert = UIAlertController(title: "Confirmation Message", message: "Do you want to cancel this request ?", preferredStyle: .alert)
        //
        //
        //
        //        self.present(alert, animated: true)
        //        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
        //            print("You choosed Yes !")
        //
        //            var fullDateTimeString = ("\(self.testStatusObj.dateForTakingSample) \(self.testStatusObj.timeForTakingSample)")
        //           if self.canCancelRequest(requestDateTime:fullDateTimeString)
        //           {
        //
        //           }else {
        //
        //
        //                  let alert = UIAlertController(title: "Confirmation Message", message: "Sorry You can't cancel this request we are about to take your ssample now if you insest please call the laboratory ?", preferredStyle: .alert)
        //
        //
        //
        //                  self.present(alert, animated: true)
        //
        //
        //            }
        //
        //        }))
        //        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
        //                  print("You choosed NOoOo !")
        //              }))
        
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
        //         let backBarButtonItem = UIBarButtonItem(title: "BackMe!", style: .plain, target: nil, action: nil)
        //                      navigationItem.backBarButtonItem = backBarButtonItem
        RequestStatusTableViewController.page = x;
        showDetailsPage = true
        
        x = 1
        showCancel = 0 
        stepIndecatorShow = 0
        
        self.dateTextArea.text = self.testStatusObj.dateRequest
        self.timeTextArea.text = self.testStatusObj.timeRequest
        guard let locAddress = self.testStatusObj?.address else{
            tableView.reloadData()
            return
        }
        let location = "\( locAddress.address1) \( locAddress.buildingNo!)  \(locAddress.apartmentNo!)\(locAddress.floorNo!)"
        
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
    
    
    
    //********** Delete Request Button *************** ///
    // ************                       ****************
    
    
    @IBAction func deleteRefusedRequestBtn(_ sender: Any) {
        
        alertStatus = 1
        Alert.showAdvancedAlert(title: "STATUS_CONFIRMATION".localized, message: "STATUS_DELETE_CONFIRMATION".localized, viewAdvancedAlertRef: self)
        
        
        //                let alert = UIAlertController(title: "Confirmation", message: "Do You Want To Delete This Request ?!", preferredStyle: .alert)
        //
        //
        //
        //                self.present(alert, animated: true)
        //
        //                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
        //                                   print("You choosed Yes !")
        //
        //                                  let deleteRequestPresenter = DeleteRequestPresenter(deleteRequestRef : self)
        //
        //                                   deleteRequestPresenter.deleteRequest(reqId: self.testStatusObj.id!)
        //                               }))
        //
        //
        //               alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
        //                    print("You choosed NOoOo !")
        //                }))
        
        
        
        
        
        
        
        //                let alert = UIAlertController(title: "Confirmation", message: "Do You Want To Delete This Request ?!", preferredStyle: .alert)
        //
        //
        //
        //                self.present(alert, animated: true)
        //                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
        //                    print("You choosed Yes !")
        //
        //                   let deleteRequestPresenter = DeleteRequestPresenter(deleteRequestRef : self)
        //
        //                    deleteRequestPresenter.deleteRequest(reqId: self.testStatusObj.id!)
        //                }))
        //                alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
        //                          print("You choosed NOoOo !")
        //                      }))
        
        
    }
    
    
    ///////////////////////// 585 //////////////////////////
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(Auth.auth().currentUser?.uid == nil)
        {
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginSVC") as! LoginTableViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
            
        }
        
        
        
        
        
        ///*********************////
        //              testStatusObj = Test();
        //
        //              let requesStatusPresenter : RequestStatusPresenter = RequestStatusPresenter(requestViewRef : self)
        //                     requesStatusPresenter.getRequest(testId: testID)
        //              //-M7T-mc9zrSii2vWJ9zE *****  -M7T0G0OLT8h5zPdV0AN   ---- -M7T1XRN8LiaLBI9D2XS
        //              // refused -M7T1XRN8LiaLBI9D2XS  -- result -M7T0YuvqO4XbT-iAkOZ
        //               progressBarView.currentStep=0
        //               x=0
    }
    
    //************** Back Buttom *****************//
    @objc func backTapped() {
        print("Button tapped")
        
        if showDetailsPage == true {
            stepIndecatorShow = 100
            // x = 7
            x = RequestStatusTableViewController.page!
            tableView.reloadData()
            showDetailsPage = false
        }else{
            self.navigationController?.popViewController(animated: true)
        }
        showDetailsPage=false
        
        
        
    }
    
    /************** VIew Did Load  ***********************/
    
    override func didReceiveMemoryWarning() {
        print(" *************  Mamory Warning ****** ......")
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let backBtn = UIBarButtonItem(title: "〈 "+"STATUS_BACK".localized, style: .plain, target: self, action: #selector(backTapped))
        
        self.navigationItem.setLeftBarButtonItems([backBtn], animated: true)
        
        self.progressBarView.circleColor = #colorLiteral(red: 0.03529411765, green: 0.7411764706, blue: 0.9764705882, alpha: 1)
        self.progressBarView.circleTintColor = #colorLiteral(red: 0.03529411765, green: 0.7411764706, blue: 0.9764705882, alpha: 1)
        //UIColor(red: 179.0/255.0, green: 189.0/255.0, blue: 194.0/255.0, alpha: 1.0)
        
        //****************** Languages check ****************///
        if Locale.current.languageCode == "ar"
        {
            progressBarView.direction = StepIndicatorViewDirection(rawValue: 1)!
        }
        
        ///*********************////
        testStatusObj = Test();
        
        print( testID!)
        let requesStatusPresenter : RequestStatusPresenter = RequestStatusPresenter(requestViewRef : self)
        requesStatusPresenter.getRequest(testId: testID)
        //-M7T-mc9zrSii2vWJ9zE *****  -M7T0G0OLT8h5zPdV0AN   ---- -M7T1XRN8LiaLBI9D2XS
        // refused -M7T1XRN8LiaLBI9D2XS  -- result -M7T0YuvqO4XbT-iAkOZ
        progressBarView.currentStep=0
        x=0
        
        locationTextArea.title = "STATUS_LOCATION".localized
        timeTextArea.title = "STATUS_TIME".localized
        dateTextArea.title = "STATUS_DATE".localized
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
        
        if #available(iOS 13.0, *) {
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(RequstDetailsTableViewController.didTap))
            
            slideShow.addGestureRecognizer(recognizer)
            //            slidShowImageArray = []
            //            tableView.reloadData()
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
        
        if indexPath.row==1{
            
            return 52
        }
        
        if indexPath.row==14{
            
            return 0
        }
        if indexPath.row==15{
            return 30
        }
        
        //
        if (x==0){
            
            if (indexPath.row==0 || indexPath.row == 1 || indexPath.row==2 || indexPath.row==3 || indexPath.row==4 || indexPath.row==5 || indexPath.row==6 ||    indexPath.row==7  || indexPath.row==8  || indexPath.row==9  || indexPath.row==10  || indexPath.row==11 ||  indexPath.row==12  || indexPath.row==13 || indexPath.row==15){
                return 0
            }
            
            
            if indexPath.row==14{
                return 200
            }
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
            
            if ( indexPath.row==2 || indexPath.row==3 || indexPath.row==4 || indexPath.row==5  || indexPath.row==13 ){
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
            if indexPath.row==11{
                return  locationCell
            }
             
            
            
            if indexPath.row==12{
                return showCancel
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
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        formatter.dateFormat = "MMM dd, yyyy hh:mm a"
        let formatedRequestDateTime = formatter.date(from:requestDateTime)
        
        let now = Date()
        print(now)
        
        let datePlus3Hours = Calendar.current.date(byAdding: .hour, value: 3, to: now)!
        
        
        print(datePlus3Hours)
        
        guard let formated = formatedRequestDateTime else
        {
            return isOk;
        }
        
        if formated >= datePlus3Hours
        {
            isOk = true;
            print(" hello  \(formatedRequestDateTime!) ")
        }
        
        
        
        return isOk;
    }
    
    
    //MARK: onConnctionFails
    func onConnectionFaile()
    {
        self.x = 0
    }
    
    //MARK: OnReiveRequest
    
    func onReceiveRequestStatus(myObj:Test) {
        print("*************************")
        
        
        self.testStatusObj = myObj
        
        if myObj.isFromHome == false
        { //  change text of employee details , show emp details button and hide locationCell  if isFormHome == false
            self.isFromHomeCheck = false ;
            employeeTitleText.text = "STATUS_IS_NOT_FROM_HOME_TEXT".localized
            showRequestOutlet.titleLabel?.text = "STATUS_SHOW_LAB_DETALS".localized
            locationCell = 0
        }
        
         locationCell = 70  // if isFromHome == true  show location cell
        
        if let roushetas = myObj.roushettaPaths , myObj.roushettaPaths!.count>0 {
            
            loadImage(imageArray: roushetas)
            imgSlider = 220
            
        }
        
        
        if let testNames = myObj.testName ,  myObj.testName!.count>0  {
            
            testTextArray = testNames
            
            testArrTite = 50
            testArrContent = 80
            
            
        }
        
        
        
        
        print("*************************")
        if myObj.status == "PendingForLabConfirmation"
        {
            self.x=1
            progressBarView.currentStep=0
            
            testArrContent = 80
            
            
            showCancel = 50
            
            self.codeText.text = myObj.generatedCode!
            self.dateTextArea.text = myObj.dateRequest!
            self.timeTextArea.text = myObj.timeRequest!
            if let location = myObj.address {
                let myAdress = "\( location.address1!) \( location.buildingNo!)  \(location.apartmentNo!)     \(location.floorNo!)"
                
                self.locationTextArea.text = myAdress
            }
            
            
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
                self.costText.text = "STATUS_COST".localized + ": \(myObj.totalCost!) " + "STATUS_COST_VALUE".localized
                
                
            }else if myObj.status == "PendingForResult"
            {
                self.x=7
                progressBarView.currentStep=2
                self.codeText.text = myObj.generatedCode
                showCancel = 50
                
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
                self.progressBarView.circleColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                self.progressBarView.circleTintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                // self.tableView.reloadData()
                
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
                if let DImage = downloadedImage{
                    
                    let i=ImageSource(image:DImage)
                    self.slidShowImageArray.append(i)
                    count += 1
                    if count >= imageArray.count{
                        self.slideShow.setImageInputs(self.slidShowImageArray)
                        self.tableView.reloadData()
                        self.collectionView.reloadData()
                        
                    }
                    
                    
                }else{
                    return
                }
                
            })
            
        }
        
    }
    
    
    
}


extension RequestStatusTableViewController : ICancelRequestView
{
    func onCancelDone() {
        self.navigationController?.popViewController(animated: true)
        
        Alert.showSimpleAlert(title: "STATUS_CONFIRMATION",message: "STATUS_CANCEL_SUCCESS", viewRef: self)
        //************ back **************/
        
        
        //        let alert = UIAlertController(title: "Confirmation", message: "Your Request has been canceled Successfully", preferredStyle: .alert)
        //
        //
        //
        //                self.present(alert, animated: true)
        //                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
        //                    print("You choosed Yes !")
        
        
        //  }))
        
        
        //        let alert = UIAlertController(title: "Confirmation", message: "Your Request has been canceled Successfully", preferredStyle: UIAlertController.Style.alert)
        //            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        //                alert.present(alert, animated: true, completion: nil)
        //        //************ back **************/
        //
        //          self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func oncancelFailed(error : String) {
        
        
        Alert.showSimpleAlert(title: "Sorry",message: "STATUS_CANCEL_FAILS", viewRef: self)
        
        
        //        let alert = UIAlertController(title: "Sorry", message: error, preferredStyle: UIAlertController.Style.alert)
        //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        //                    alert.present(alert, animated: true, completion: nil)
        
    }
    
    
    
}



extension RequestStatusTableViewController : IDeleteRequestView
{  
    func onRequetDeleted() {
        Alert.showSimpleAlert(title: "INFORMATION",message: "STATUS_DELETION_SUCCESS", viewRef: self)
        //************ back **************/
        self.navigationController?.popViewController(animated: true)
        
        
        
        //     let alert = UIAlertController(title: "Confirmation", message: "Your Request has been Deleted Successfully", preferredStyle: UIAlertController.Style.alert)
        //                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        //                    alert.present(alert, animated: true, completion: nil)
    }
    
    func onRequetFailed() {
        Alert.showSimpleAlert(title: "sorry",message: "STATUS_DELETION_FAILS", viewRef: self)
        
        //        let alert = UIAlertController(title: "Sorry", message: "Faild to Delete this Request", preferredStyle: UIAlertController.Style.alert)
        //                   alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        //                       alert.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
}



extension RequestStatusTableViewController : IViewAdvancedAlert,IView{
    /// ***********   Cancel Request Btn ********* //
    func pressOk() {
        
        
        
        if alertStatus == 0 // alertStatue = 0 Cancel
        {
            print("Cancel request .... !")
            
            var fullDateTimeString = ("\(self.testStatusObj.dateForTakingSample!) \(self.testStatusObj.timeForTakingSample!)")
            if self.canCancelRequest(requestDateTime:fullDateTimeString)
            {
                let cancelrequestPresenter = CancelRequestPresenter(cancelRequestRef : self)
                
                //var test = Test()
                // test.id = testStatusObj.id
                
                //  test.status = "Canceled"
                
                cancelrequestPresenter.cancelRequest(testObj: testStatusObj)
                
            }else {
                
                
                Alert.showSimpleAlert(title: "sorry",message: "STATUS_SORRY_CANCEL", viewRef: self)
                
                //  Alert.showAdvancedAlert(title: "STATUS_CONFIRMATION".localized, message: "STATUS_DELETE_CONFIRMATION".localized, viewAdvancedAlertRef: self)
                
                //                     let alert = UIAlertController(title: "Confirmation Message", message: "Sorry You can't cancel this request we are about to take your sample now if you insest please call the laboratory ?", preferredStyle: .alert)
                //
                //
                //                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                //                                 print("You choosed NOoOo !")
                //                            }))
                //                     self.present(alert, animated: true)
                
                
            }
            
        }
        else if alertStatus == 1 // alertStatus == 1 Delete
        {
            let deleteRequestPresenter = DeleteRequestPresenter(deleteRequestRef : self)
            
            deleteRequestPresenter.deleteRequest(reqId: self.testStatusObj.id!)
            
        }
        
        
    }
    
    func pressCancel() {
        
        print("Cancel Pressed !")
        
    }
    
    //  showAdvancedAlert(title: String ,message: String, viewAdvancedAlertRef: IViewAdvancedAlert)
}
