//
//  newRequestTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import OpalImagePicker
import ImageSlideshow
import SkyFloatingLabelTextField
import Firebase
import Alamofire
class NewRequestTableViewController: UITableViewController,OpalImagePickerControllerDelegate,IFillDataCells , IGetAddress , UITextFieldDelegate{
    
    @IBOutlet var noImageLabel: UILabel!
    @IBOutlet weak var myCell: UITableViewCell!
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var enterTestTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var slideShow: ImageSlideshow!
    @IBOutlet weak var deleteImageBtn: UIButton!
    @IBOutlet weak var uploadImage: UIButton!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var loadingImagesMessages: UILabel!
    
    @IBOutlet var addressTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var dateTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var timeTextField: SkyFloatingLabelTextFieldWithIcon!
    var testTexts=[String]()
    var pageControl = UIPageControl()
    var inputImageArray=[InputSource]()
    var DatabaseImageArray=[UIImage]()
    var defaultImage=[InputSource]()
    var imagePicker: ImagePicker!
    let datePicker=UIDatePicker()
    let timePicker=UIDatePicker()
    var ind:Int!
    var x=1
//    var hasAddress = false
    var branchId : String?
    var labId: String?
    var isFromHome: Bool?
    var addressObj : Address!
    var user : User!
    @IBOutlet var saveRequestBtn: UIButton!
    @IBAction func saveNewRequestBtn(_ sender: UIButton) {
        if(checkValidation()){
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            let currentDate = dateFormatter.string(from: date)
            dateFormatter.dateFormat = "h:mm a"
            let currentTime = dateFormatter.string(from: date)

            
            var testObj = Test()
            testObj.roushettaPaths = [String]()
            testObj.resultFilespaths = [String]()
            testObj.testName = testTexts
            testObj.branchId = branchId
            testObj.labId = labId
            testObj.dateForTakingSample = dateTextField.text
            testObj.timeForTakingSample = timeTextField.text
            testObj.address = addressObj
            testObj.userId = Auth.auth().currentUser?.uid
            testObj.status = "PendingForLabConfirmation"
            testObj.dateRequest = currentDate
            testObj.timeRequest = currentTime
//            testObj.timeStampRequest = Date().toMillis()
//            testObj.dateRequestFormat = Date()
            testObj.isFromHome = isFromHome
            var newRequestPresenter = NewRequestPresenter(newRequestViewRef: self)
            newRequestPresenter.saveRequest(testObj: testObj, roushettaImages: DatabaseImageArray)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        hashString(str: "Vgo15V8FFZX9b9bRtFT3kkAdJ9D2")
        enterTestTextField.delegate=self
        addressTextField.delegate=self
        dateTextField.delegate=self
        timeTextField.delegate=self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        uploadImage.layer.cornerRadius=uploadImage.frame.width/2
        
        
        deleteImageBtn.layer.cornerRadius=deleteImageBtn.frame.width/2
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        createDatePicker()
//        createTimePicker()
        timeTextField.isEnabled = false
        activityIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        activityIndicator.hide()
        activityIndicator.alpha = 0
        dateTextField.addTarget(self, action: #selector(NewRequestTableViewController.textFieldDidChange(_:)), for: .editingChanged)
        saveRequestBtn.layer.cornerRadius=30
        saveRequestBtn.layer.borderColor=UIColor.white.cgColor
        saveRequestBtn.layer.borderWidth=2
    }
    
    @objc func textFieldDidChange(_ textField: SkyFloatingLabelTextFieldWithIcon) {
        if textField.text!.isEmpty {
            timeTextField.isEnabled = false
            timeTextField.text = ""
        }
    }
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        if scoreText == enterTestTextField{
            testTexts.append(enterTestTextField.text!)
            collectionView.reloadData()
            enterTestTextField.text=""
            tableView.reloadData()
        }
        return true
    }
    
    
    // function to enable dimiss key board(touch any where )
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool) {
         
//        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/ClientAnalysisRequests").validate().responseJSON { response in
//        print(response)
//
//        }
        if(Auth.auth().currentUser?.uid == nil)
        {
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginSVC") as! LoginTableViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)

        }
        else {
            var profilePresenter = ProfilePresenter(profileView: self)
            profilePresenter.getUser(userId: Auth.auth().currentUser!.uid)
        }
        tableView.rowHeight = UITableView.automaticDimension
        slideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        
        
        
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        slideShow.pageIndicator = pageControl
        
        slideShow.activityIndicator = DefaultActivityIndicator()
        slideShow.delegate = self
        slideShow.contentScaleMode = .scaleToFill
        
        defaultImage=[
            ImageSource(image: UIImage(named: "default")!)]
        
        if (inputImageArray.isEmpty){
            
            slideShow.setImageInputs(defaultImage)
            noImageLabel.alpha = 1
            deleteImageBtn.alpha=0
        }
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(NewRequestTableViewController.didTap))
        slideShow.addGestureRecognizer(recognizer)
        tableView.reloadData()
    }
    
    
    // Delegate Metoda For Navigation from table testNames
    func fillData(testsNames:NSMutableArray) {
        testTexts.removeAll()
        for i in testsNames{
            testTexts.append(i as! String)
        }
//        testTexts.append(dataObj)
        collectionView.reloadData()
    }
    
    
    //to hide cells
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        
        if (x%2==0){ // for normal request
            
            if (indexPath.row==2 || indexPath.row==3 || indexPath.row==4  ){
                return 70
            }
            
            if indexPath.row==0{
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
            
            
            
            if (indexPath.row==5||indexPath.row==6){
                return 0
            }
            if indexPath.row==7{
                return 50
            }
            
        }
            
        else if indexPath.row == 0 {
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
        
        if (indexPath.row == 2||indexPath.row == 3||indexPath.row==4){
            
            return 70
        }
        
        
        if indexPath.row == 7{
            return 50
        }
        if indexPath.row == 5{// FILLED ADRESS
            if(addressObj==nil)
            {
                return 0
            }
            else{
                addressTextField.text = addressObj.address1
                return 70
            }
        }
        
        if indexPath.row==6{// FILLED ADRESS
            if(isFromHome! && addressObj==nil)
            {
                return 50
            }
            else{
                return 0
            }
        }
        return tableView.rowHeight
    }
    
    
    
    
    
    
    
    @IBAction func addTestTextBtn(_ sender: Any) {
        
        let text=enterTestTextField.text
        if(text != "")
        {
            testTexts.append(text!)
            collectionView.reloadData()
            enterTestTextField.text=""
            tableView.reloadData()
        }
        else{
            var selectedTests = NSMutableArray()
            for i in testTexts{
                selectedTests.add(i)
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "testNameGroupSVC") as! TestNamingGroupViewController
            vc.selectedTests = selectedTests
            vc.delegate=self
            navigationController?.pushViewController(vc, animated: true)
            
            
        }
        
        
    }
    
    
    
    
    @IBAction func deleteImageBtn(_ sender: Any) {
        
        
//        if(inputImageArray.isEmpty){
//            print("no data")
//            slideShow.setImageInputs(defaultImage)
//            tableView.reloadData()
//        }
//        else{
            inputImageArray.remove(at: ind)//remove from slideshoe
            DatabaseImageArray.remove(at: ind)//remove from database
        if inputImageArray.count == 0 {
            slideShow.setImageInputs(defaultImage)
            noImageLabel.alpha = 1
            deleteImageBtn.alpha=0
        }
        else{
            slideShow.setImageInputs(inputImageArray)
//            noImageLabel.alpha = 0
        }
            tableView.reloadData()
//        }
        
        
    }
    
    
    
    @IBAction func uploadImageBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "Photo", message: "Please Select an Option", preferredStyle: .actionSheet)
        
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
            
            DatabaseImageArray.append(img) // to save to database
            
            var x=ImageSource(image: img)
            inputImageArray.append(x) // to save in slidshow
            ind=0
             deleteImageBtn.alpha=1
            noImageLabel.alpha = 0
            
        }
        
        slideShow.setImageInputs(inputImageArray)
        
        
        presentedViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    
    func createDatePicker(){
        
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        let doneBtn=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:#selector(donePressed))
        toolbar.setItems(([doneBtn]), animated: true)
        datePicker.minimumDate = Date()
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
//        formatter.times
        var x = datePicker
        var order = Calendar.current.compare(Date(), to: datePicker.date, toGranularity: .day)

        if order == .orderedSame{
            timePicker.minimumDate = Date()
        }
        else {
            timePicker.minimumDate = nil
        }
        
        dateTextField.text=formatter.string(from: datePicker.date)
        timeTextField.isEnabled = true
        self.view.endEditing(true)
        createTimePicker()
    }
    
    
    
    func createTimePicker(){
        
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        let doneBtn=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:#selector(doneTimePressed))
        toolbar.setItems(([doneBtn]), animated: true)
//        if
        timeTextField.inputAccessoryView=toolbar
        timeTextField.inputView=timePicker
        timePicker.datePickerMode = .time
        
    }
    
    @objc func doneTimePressed(){
        
        
        let formatter=DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        timeTextField.text=formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    
    
    
    
    @IBAction func enterLocationBtn(_ sender: Any) {
        
        
        
        let alert = UIAlertController(title: "Location", message: "Please Select an Option", preferredStyle: .actionSheet)
        if(user == nil)
        {
            Alert.showSimpleAlert(title: "Alert", message: "please wait for loading data", viewRef: self)
        }
        else{
        if user.address!.address1! != "" {
            alert.addAction(UIAlertAction(title: "Use your saved location", style: .default , handler:{ (UIAlertAction)in
                        print("User click Approve button")
                        
            //            self.y=2
                self.addressObj = self.user.address!
                        
                        self.tableView.reloadData()
                        
                    }))
        }
        }
        
        alert.addAction(UIAlertAction(title: "Add new location  ", style: .default , handler:{ (UIAlertAction)in
            
            let vc = self.storyboard!.instantiateViewController(withIdentifier:"ReqlocationSVC") as! ReqLocationTableViewController
            vc.parentRef = self
            vc.isEditable=true;
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        
        self.tableView.reloadData()
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
        
        
        
    }
    @IBAction func previewAddressBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ReqlocationSVC") as! ReqLocationTableViewController
        
                vc.isEditable=false;
        if user.address?.address1! != "" {
                           vc.addressObj = user.address
                      }
        
        
                      navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    @IBAction func updateHelthSheetBtn(_ sender: Any) {
        
        
        
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "healthSVC") as! HealthProfileTableViewController
            
            
                          navigationController?.pushViewController(vc, animated: true)
        
        
        
        
    }
    
    
    
}





extension NewRequestTableViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int){
        
        ind=page
    }
}


// to save one image

extension NewRequestTableViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        
        DatabaseImageArray.append(image!)
        
        var x=ImageSource(image:image!)
        inputImageArray.append(x)
        ind=0
        slideShow.setImageInputs(inputImageArray)
         deleteImageBtn.alpha=1
        noImageLabel.alpha = 0
        
    }
}





extension NewRequestTableViewController:UICollectionViewDelegate,UICollectionViewDataSource{
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
        cell.layer.cornerRadius=8
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
        tableView.reloadData()
    }
    
    func getAddress(addressObj: Address) {
        self.addressObj = addressObj
    }
//    func hashString(str: String) -> Int {
//            var hash : Double = 0
//            for i in 0..<str.count {
//    //            var yy = Character("a").asciiValue
//    //            var x = Character(str[i]).asciiValue
//                var x = Double(Character(str[i]).asciiValue * 31)
//                var y = Double(str.count - i)
//                hash += pow(x,y)
//    //            pow(Decimal(Character(str[i]).asciiValue * 31), 5)
//                var newhash = Int64(hash) & Int64(hash)
//            }
//        return hash.toInt()!
//        }
}



//
//extension Double {
//    func toInt() -> Int? {
//        if self >= Double(Int.min) && self < Double(Int.max) {
//            return Int(self)
//        } else {
//            return nil
//        }
//    }
//}
