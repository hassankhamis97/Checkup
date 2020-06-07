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
           
            guard let branchId = testStatusObj.branchId else{
                return
            }
//             navigationController?.pushViewController(labDescriptionVC, animated: true)
        branchDesc.branchId = branchId ;
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
    
    @IBAction func cancelRequestBtn(_ sender: Any) {
        print("cancel taped ")
        alertStatus = 0
        Alert.showAdvancedAlert(title: "STATUS_CONFIRMATION".localized, message: "STATUS_CANCEL_CONFIRMATION".localized, viewAdvancedAlertRef: self)
        
    }
    
    var pageControl = UIPageControl()
    var imageArray:[UIImage]!
    //var testTextArray=["TSH","CBC","HbA1-c"]
    var testTextArray : [String] = []
    var savedImageArray=[UIImage]() // coming from data base
    var slidShowImageArray=[InputSource]()// converted savedImage
    var x=0; // will be deleted just for testing confirmation and refusing state
    
    
    @IBOutlet weak var progressBarView: StepIndicatorView!
   
    @IBAction func showRequestDetailsBtn(_ sender: Any) {

        RequestStatusTableViewController.page = x;
        showDetailsPage = true
        
        x = 1
        showCancel = 0 
        stepIndecatorShow = 0
        
        self.dateTextArea.text = self.testStatusObj.dateForTakingSample
        self.timeTextArea.text = self.testStatusObj.timeForTakingSample
        guard let locAddress = self.testStatusObj?.address else{
            tableView.reloadData()
            return
        }
//        let location = locAddress.address1
        
        self.locationTextArea.text = locAddress.address1
        
        tableView.reloadData()
    }

    ////////// refused ///////////////////
    
    @IBOutlet weak var refuseReasonText: UILabel!
    
    
    @IBOutlet weak var refuseDescriptionText: UITextView!
    
    
    
    //********** Delete Request Button *************** ///
    // ************                       ****************
    
    
    @IBAction func deleteRefusedRequestBtn(_ sender: Any) {
        
        alertStatus = 1
        Alert.showAdvancedAlert(title: "STATUS_CONFIRMATION".localized, message: "STATUS_DELETE_CONFIRMATION".localized, viewAdvancedAlertRef: self)
      
        
    }
    
    
    ///////////////////////// 585 //////////////////////////
    
    
    override func viewWillAppear(_ animated: Bool) {
        
      
        
        if(Auth.auth().currentUser?.uid == nil)
        {
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginSVC") as! LoginTableViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
            
        }
    
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
//        if #available(iOS 13.0, *) {
//            var img = UIImage(systemName: "teletype.answer")
//        } else {
//            // Fallback on earlier versions
//        }
        
//        let button =  UIButton(type: .custom)
//        button.setImage(UIImage(named: "Back_50px"), for: .normal)
//       // button.alignmentRectInsets
//        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
//        button.frame = CGRect(x: 0, y: 0, width: 33, height: 15)
//        button.imageEdgeInsets = UIEdgeInsets(top: -1, left: 32, bottom: 1, right: -32)//move image to the right CGRectMake(3, 5, 50, 20)
//        let label = UILabel(frame:CGRect(x: 3, y: 5, width: 50, height: 20))
//        label.font = UIFont(name: "Arial-BoldMT", size: 16)
//        label.text = "Back"
//        label.textAlignment = .center
//        label.textColor = UIColor.white
//        label.backgroundColor =   UIColor.clear
//        button.addSubview(label)
//        let barButton = UIBarButtonItem(customView: button)
//        self.navigationItem.leftBarButtonItem = barButton
//
//
        let leftButtonView = UIView.init(frame: CGRect(x: -40, y:0, width: 110, height: 50))

        let leftButton = UIButton.init(type: .system)
        leftButton.backgroundColor = .clear
        leftButton.frame = leftButtonView.frame
        leftButton.setImage(UIImage(named: "icons8-back-20"), for: .normal)
        leftButton.setTitle("Back", for: .normal)
        leftButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)    //Your desired color.
        leftButton.autoresizesSubviews = true
        leftButton.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        leftButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        leftButtonView.addSubview(leftButton)

        let leftBarButton = UIBarButtonItem.init(customView: leftButtonView)
        navigationItem.leftBarButtonItem = leftBarButton
        
//        var backBtnImage = UIBarButtonItem()
//        if #available(iOS 13.0, *) {
//            backBtnImage = UIBarButtonItem(image: UIImage(systemName: "teletype.answer"), style: .plain, target: self, action: #selector(backTapped))
//        } else {
//            // Fallback on earlier versions
//        }
//        let backBtn = UIBarButtonItem(title:"STATUS_BACK".localized, style: .plain, target: self, action: #selector(backTapped))
//
//        self.navigationItem.setLeftBarButtonItems([backBtnImage,backBtn], animated: true)
//
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
            
            if (indexPath.row==9 || indexPath.row==10 ){
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





