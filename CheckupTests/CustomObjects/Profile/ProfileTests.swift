//
//  ProfileTests.swift
//  CheckupTests
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import XCTest
@testable import Firebase
@testable import Checkup

class ProfileTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
         let expectationObj = expectation(description: "Waiting for reponse")
         var ref: DatabaseReference!
                 ref = Database.database().reference()
                    ref.child("Users").child("gLcrV5nCzhREMdrgH57eDfRanr22").observeSingleEvent(of: .value, with: { (snapshot) in
                        // Get user value
                        let value = snapshot.value as? NSDictionary
              
                        let username = value?["email"] as? String ?? ""
                           print( "username:" + username)
                        
                        
                        let phone = value?["phone"] as? NSArray
                        
                        for obj in phone!{
                            let dict = obj as! NSDictionary
                            let mobileNumber =  dict.value(forKey: "number") as! String

                            print ("mob="+mobileNumber)
                        }
                        
                        
                        
                        print(phone)
                        
                        
                        
                        
                          expectationObj.fulfill()
                        })
                    
                    { (error) in
                          print(error.localizedDescription)
                      }
              
          waitForExpectations(timeout: 15.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
