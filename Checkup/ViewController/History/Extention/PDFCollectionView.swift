//
//  PDFCollectionView.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension ResultDetailsTableViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if testObj==nil {
            return 0
        }
        return testObj.resultFilespaths!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pdfCell", for: indexPath) as! ResultPDFCollectionViewCell
        cell.pdfNameLabel.text = "Result \(indexPath.row + 1)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pdfHistory = storyboard?.instantiateViewController(withIdentifier: "pdfHistory") as! PdfResultViewController
        pdfHistory.pdfUrl = testObj!.resultFilespaths![indexPath.row]
         pdfHistory.branchId = testObj!.branchId!
      
        
        // set condiotion here if value not true
        if idAndDict.count > 0 {
       pdfAndOpenDict.updateValue(true, forKey: testObj.resultFilespaths![indexPath.row])
          idAndDict.updateValue(pdfAndOpenDict, forKey: String(testObj!.id!))

        }
//        pdfCounter = pdfCounter + 1
//        pdfHistory.pdfCounter = pdfCounter
    
        
        
        pdfHistory.noOfPdfObjInArr = testObj!.resultFilespaths!.count
        pdfHistory.dict = pdfAndOpenDict
//        pdfHistory.pdfProtocol = self
        pdfHistory.testId = String(testObj!.id!)
     //   pdfAndOpenDict.values[indexPath.row] = true
   
        // print("retrieved Dictionary\(retrieveDic())")
        
        navigationController?.pushViewController(pdfHistory, animated: true)
        
    }
//    func removeDict(newDict: Dictionary<String, Any>) {
//        //pdfAndOpenDict.remov
//        print("new Dict \(newDict)")
//        for dic in newDict{
//            print("dic \(dic)")
//
//
//            //update old values with new value first
//            pdfAndOpenDict.updateValue(dic.value as! Bool , forKey: dic.key)
//            print("dictionary after replacinf \(pdfAndOpenDict)")
//
//            for pdf in idAndDict{
//                print("pdf \(pdf)")
//                idAndDict.updateValue(pdfAndOpenDict, forKey: pdf.key)
//
//        }
//        print(pdfAndOpenDict)
//        print(idAndDict)
//        print(idAndDict.values)
////            saveDictionary(dict: idAndDict, key: "testttt")
////
////
////            getDictionary(key: "testttt")
//    //    saveDic(dictionary: idAndDict)
//
//
//    }

//    }
    

    
}
