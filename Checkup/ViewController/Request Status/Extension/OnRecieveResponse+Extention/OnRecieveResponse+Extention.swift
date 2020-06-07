//
//  OnRecieveResponse+Extention.swift
//  Checkup
//
//  Created by kasper on 6/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import SDWebImage
import  ImageSlideshow
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
        }else{
            locationCell = 70  // if isFromHome == true  show location cell

        }
        
        
        if let roushetas = myObj.roushettaPaths , myObj.roushettaPaths!.count>0 {
            
            loadImage(imageArray: roushetas)
            imgSlider = 220
            
        }
        
        
        if let testNames = myObj.testName {
            if testNames.count>0  {
            
            testTextArray = testNames
            
            testArrTite = 50
            testArrContent = 80
            }
            
        }
        
 
        
        print("*************************")
        if myObj.status == "PendingForLabConfirmation"
        {
            self.x=1
            progressBarView.currentStep=0
            
           //
            
            
            showCancel = 50
            
            self.codeText.text = myObj.generatedCode!
            self.dateTextArea.text = myObj.dateForTakingSample!
            self.timeTextArea.text = myObj.timeForTakingSample!
            if let location = myObj.address {
//                let myAdress = "\( location.address1!) \( location.buildingNo!)  \(location.apartmentNo!)     \(location.floorNo!)"
                
                self.locationTextArea.text = location.address1!
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
                self.refuseReasonText.text = myObj.radioReason
                self.refuseDescriptionText.text = myObj.refuseReason
                
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

