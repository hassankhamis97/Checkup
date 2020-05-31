//
//  LabCollectionTests.swift
//  CheckupTests
//
//  Created by Hassan Khamis on 5/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import XCTest
@testable import Firebase
@testable import Checkup
//@testable import Lab
class LabCollectionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        Laboratory
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLab() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        func childByAutoId() -> DatabaseReference
        let expectationObj = expectation(description: "Waiting for reponse")

        var labObj = Laboratory(id: "", name: "El Borg", formalReferencePathId: "", specialTests: "", image: "", branches: ["",""])
        
        var ref: DatabaseReference!

        ref = Database.database().reference()
        var id = ref.childByAutoId()
        labObj.id = id.key! as! String
        expectationObj.fulfill()
//        ref.child("Lab").child(labObj.id!).setValue(labObj.toDictionary())
        waitForExpectations(timeout: 15.0)

    
    }
    

}
