//
//  GetRequestData.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
extension ResultDetailsTableViewController : IRequestStatusView {
    func onReceiveRequestStatus(myObj: Test) {
        testObj = myObj
        descriptionTextView.text = testObj.description ?? "RESULT_NO_DESCRIPTION".localized
        resultDateTextView.text = testObj.dateResult ?? "RESULT_NO_Date".localized
        resultTimeTextView.text = testObj.timeResult ?? "RESULT_NO_TIME".localized
        pdfCollectionView.reloadData()
        if isNotified == false {
            if let testDictionary : [String : Dictionary<String, Any>]? = getDictionary(key: String(testObj!.id!)) {
                if testDictionary != nil {
                    idAndDict = testDictionary!
 
                }
            }
//            if let testDictionary = getDictionary(key: String(testObj!.id!)) {
//                return
//            }
//            idAndDict = testDictionary
//            if(idAndDict == n)
            
        }
              else {
                  // first time fish
            for index in 0..<testObj.resultFilespaths!.count{
                      pdfAndOpenDict.updateValue(false, forKey: testObj!.resultFilespaths![index])
                      print("dicyionray \(pdfAndOpenDict)")
                      idAndDict.updateValue(pdfAndOpenDict,forKey: String(testObj!.id!))
                      saveDictionary(dict: idAndDict, key: String(testObj!.id!))
                  }
                 
              }
    }
    
   
    func onConnectionFaile() {
        
    }
    
    
}
