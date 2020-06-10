//
//  PDFCollectionView.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension ResultDetailsTableViewController : UICollectionViewDelegate, UICollectionViewDataSource , PdfProtocol {
    
    
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
      
        
        // set condiotion here if value not true
        
        pdfAndOpenDict.updateValue(false, forKey: testObj!.testName![indexPath.row])
        print("dicyionray \(pdfAndOpenDict)")
        idAndDict.updateValue(pdfAndOpenDict,forKey: String(testObj!.id!))

  
        pdfCounter = pdfCounter + 1
        pdfHistory.pdfCounter = pdfCounter
    
        //check if it's nill then update as its first time else retrieve from usser default
  /*      if(retrieveDic().count == 0){
            print("iam empty")
        }*/
        
        pdfHistory.noOfPdfObjInArr = testObj!.resultFilespaths!.count
        pdfHistory.dict = pdfAndOpenDict
        pdfHistory.pdfProtocol = self
       // print("retrieved Dictionary\(retrieveDic())")
        
        navigationController?.pushViewController(pdfHistory, animated: true)
        
    }
    func removeDict(newDict: Dictionary<String, Any>) {
        //pdfAndOpenDict.remov
        print("new Dict \(newDict)")
        for dic in newDict{
            print("dic \(dic)")
      
            
            //update old values with new value first
            pdfAndOpenDict.updateValue(dic.value as! Bool , forKey: dic.key)
            print("dictionary after replacinf \(pdfAndOpenDict)")
     
            for pdf in idAndDict{
                print("pdf \(pdf)")
                idAndDict.updateValue(pdfAndOpenDict, forKey: pdf.key)
            
        }
        print(pdfAndOpenDict)
        print(idAndDict)
        print(idAndDict.values)
            saveDictionary(dict: idAndDict, key: "testttt")
            
            
            getDictionary(key: "testttt")
    //    saveDic(dictionary: idAndDict)
        

    }

    }
    

    
}
