//
//  RequestStatusModel.swift
//  Checkup
//
//  Created by kasper on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
class RequestStatusModel : IRequestStatusModel {
    var requestStatusPresenter :IRequestStatusPresenter!
    
    init(requestPresenterRef : IRequestStatusPresenter) {
        self.requestStatusPresenter = requestPresenterRef ;
    }
    

    
    
    
    var testStatusObj :Test! ;
    
   let  ref = Database.database().reference(withPath:"Tests");
    
    
    func onRequestStatusRevieved(labId: String, branchId: String ,id : String ) {
        testStatusObj = Test()
        testStatusObj.id = id ;
        testStatusObj.labId = labId ;
        testStatusObj.branchId = branchId ;
        
  
//        ref.child("0G9djW7SzMXGTiXKdGkiYuiTY3g1").child("-M7T-mc9zrSii2vWJ9zE").observe(.value){
//    self.ref.child(labId).child(branchId).child(branchId).observe(.value){ //*** this will be ok when adding labId in Test Table
    ref.child(branchId).child(id).observe(.value){
                   mahmoudSnapShoot in
             

           let values = mahmoudSnapShoot.value as! [String : Any]
                      
           self.testStatusObj.employeeId = values["employeeId"]as?String
           self.testStatusObj.generatedCode = values["generatedCode"]as?String
           self.testStatusObj.id = values["id"]as?String
           self.testStatusObj.isFromHome = values["isFromHome"]as?String
           self.testStatusObj.precautions = values["precautions"]as?String
           self.testStatusObj.roushettaPaths = values["roushettaPaths"] as? [String]
           self.testStatusObj.testName = values["testName"]as? [String]
           self.testStatusObj.dateRequest = values["dateRequest"]as?String
           self.testStatusObj.timeRequest = values["timeRequest"]as?String
           self.testStatusObj.dateForTakingSample = values["dateForTakingSample"]as?String
           self.testStatusObj.timeForTakingSample = values["timeForTakingSample"]as?String
           self.testStatusObj.dateResult = values["dateResult"]as?String
           self.testStatusObj.timeResult = values["timeResult"]as?String
           self.testStatusObj.refuseReason = values["refuseReason"]as?String
           self.testStatusObj.userId = values["userId"]as? String
           self.testStatusObj.status = values["status"]as?String
           self.testStatusObj.hba1c = values["hba1c"]as?String
           self.testStatusObj.isNotified = values["isNotified"]as?String
           self.testStatusObj.radioReason = values["radioReason"]as?String
           
           self.testStatusObj.generatedCode = values["generatedCode"]as?String
           self.testStatusObj.totalCost = values["totalCost"]as?String
           self.testStatusObj.description = values["description"]as?String
          
          
        var addr  = values["address"]  as? [String : String]
        guard let address = addr else {
         return
        }
            print(address["buildingNo"])
        self.testStatusObj.address = Address(address: addr!["address"]!, buildingNo: addr!["buildingNo"]!, floorNo: addr!["floorNo"]!, apartmentNo: addr!["apartmentNo"]!, longitude: addr!["longitude"]!, latitude: addr!["latitude"]!)
    
       

                     
                      
                      print("the status \(self.testStatusObj.status) the user \(self.testStatusObj.id) testCode is \(self.testStatusObj.generatedCode)")
        self.requestStatusPresenter.onRequestReceived(myObj: self.testStatusObj)
        
        
    }
    
    
    }
}

