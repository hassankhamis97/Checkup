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
    
    func getEmployeeData(EmpId: String) {
        
        ref.child(EmpId).observe(.value){
                         mahmoudSnapShoot in
            if let values = mahmoudSnapShoot.value as! [String : Any]?{
            
            var emp = Employee()
                
                if let imgPath = values["imagePath"] as! String? , let empPhones = values["phones"] as! [String]? , let empUserName = values["userName"] as! String?{
                    emp.userName = empUserName
                     emp.imagePath = imgPath
                    emp.phones = empPhones
                }
           
            
            self.emplPresenterRef.onEmployeeReceived(employee:emp )
        }
        }
        
        
    }
    
}
