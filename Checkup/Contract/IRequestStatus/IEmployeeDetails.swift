//
//  IEmployeeDetails.swift
//  Checkup
//
//  Created by kasper on 5/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//
var userName:  String?
   var email:  String?
   var password:  String?
   var imagePath:  String?
   var phones:  [String]?
import Foundation
protocol IEmployeeDetailsView  {
    func onReceiveEmployeeDetails(employee:Employee)
}
protocol IEmployeeDetailsPresenter {
    func getEmployee(empId : String )
    func onEmployeeReceived(employee:Employee)
    func onFail(message: String)
}
protocol IEmployeeDetailsModel {
    func getEmployeeData(EmpId : String)
}
