//
//  EmployeeDetailsPresenter.swift
//  Checkup
//
//  Created by kasper on 5/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class EmployeeDetailsPresenter :IEmployeeDetailsPresenter {
    var employeeViewRef : IEmployeeDetailsView!
    init(empViewRef : IEmployeeDetailsView) {
        self.employeeViewRef = empViewRef
    }
   

    
    
     func getEmployee(branchId : String ,empId : String ) {
        var emplyeeModel = EmployeeDetailsModel(emplyeePresenterRef: self)
        emplyeeModel.getEmployeeData(branchId: branchId, EmpId: empId)
    }
    
    func onEmployeeReceived(employee: Employee) {
        employeeViewRef.onReceiveEmployeeDetails(employee: employee)
    }
    
    func onFail(message: String) {
       
    }
    
    
}
