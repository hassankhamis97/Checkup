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
        let values = mahmoudSnapShoot.value as! [String : Any]
            
            var emp = Employee()
            emp.userName = values["userName"] as! String
            emp.imagePath = values["imagePath"] as! String
            emp.phones = values["phones"] as! [String]
            self.emplPresenterRef.onEmployeeReceived(employee:emp )
        }
        
        
        
    }
    
    
}
