//
//  EmployeeDetailsModel.swift
//  Checkup
//
//  Created by kasper on 5/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

import Firebase
class EmployeeDetailsModel : IEmployeeDetailsModel{
    let  ref = Database.database().reference(withPath:"Employees");
      
    var emplPresenterRef : IEmployeeDetailsPresenter
       init(emplyeePresenterRef : IEmployeeDetailsPresenter) {
           self.emplPresenterRef = emplyeePresenterRef
       }
    
    func getEmployeeData(branchId : String , EmpId: String) {
        
        ref.child(branchId).child(EmpId).observe(.value){
                         mahmoudSnapShoot in
            guard mahmoudSnapShoot.value != nil else{
           
                self.emplPresenterRef.onFail(message: "No Employee Data Found")
                return
            }
            
             let employee = mahmoudSnapShoot.value as! [String : Any]?
                       var emp = Employee()
                           
            if let imgPath = employee!["imagePath"] as! String? ,
                            let empPhones = employee!["phones"] as! [String]? ,
                            let empUserName = employee!["userName"] as! String?{
                               emp.userName = empUserName
                                emp.imagePath = imgPath
                               emp.phones = empPhones
                           }
                      
                       
                       self.emplPresenterRef.onEmployeeReceived(employee:emp )
        }
        
        
    }
    
}
