//
//  LoginTests.swift
//  CheckupTests
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import XCTest
@testable import Checkup
@testable import FirebaseAuth
class LoginTests: XCTestCase {
    var loginModel : LoginModel!
    override func setUp() {
        loginModel = LoginModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginModel = nil
    }
    

        func testLogin(){
            let expectationObj = expectation(description: "Waiting for reponse")
            Auth.auth().signIn(withEmail: "rrr@rr.com", password: "123456789Iti") { [weak self] authResult, error in
            //          guard let strongSelf = self else { return }
                      // ...
                expectationObj.fulfill()
                guard let strongSelf = self else { return }
                print(Auth.auth().currentUser?.email)
//                authResult?.user.uid
                print(strongSelf)
                    }
//            loginModel.checkUser(email: "rrr@rr.com", password: "123456789Iti")
            waitForExpectations(timeout: 15.0)
        }
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
