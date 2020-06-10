//
//  PdfResultViewController.swift
//  Checkup
//
//  Created by Aya on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import PDFKit
class PdfResultViewController: UIViewController , UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var pdfView: PDFView!
    var pdfUrl: String!
    var pdfCounter : Int!
    var noOfPdfObjInArr : Int!
    var  popupCounter = 0
    var dict : Dictionary<String, Any>!
    var pdfProtocol : PdfProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        print("hey")
        let url = URL(string: pdfUrl!)!
//            let url = URL(fileURLWithPath: pdfUrl)
            if let pdfDocument = PDFDocument(url: url){
                pdfView.autoScales = true
                pdfView.displayMode = .singlePageContinuous
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
                 
                self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backToPrevious))
                
               // print(dict.values)
               
                
            }

    }
    
    
    
    @objc func backToPrevious()  {
        var myPdf : Bool!
        for pdf in dict{
            print("pdf value\(pdf.value)")
            myPdf = pdf.value as? Bool
            myPdf  = true
            print(myPdf!)
            dict.updateValue(true, forKey: pdf.key)
            
            }
        print("new pdf value \(dict.values)")
            if(pdfCounter == noOfPdfObjInArr! && myPdf == true){
            print("dict inside condition \(dict)")
                pdfProtocol.removeDict(newDict: dict)
                let popoverContent = self.storyboard?.instantiateViewController(withIdentifier: "ratingPopup")  as! RatingTableViewController
                let nav = UINavigationController(rootViewController: popoverContent)
                nav.modalPresentationStyle = UIModalPresentationStyle.popover
                let popover = nav.popoverPresentationController
                popoverContent.preferredContentSize = CGSize(width: 500,height: 600)
                popover!.delegate = self
                popover!.sourceView = self.view
                popover!.sourceRect = CGRect(x: 100,y: 100,width: 0,height: 0)
                self.present(nav, animated: true, completion: nil)
         }
     //   }
               
        self.navigationController?.popViewController(animated: true)
    }
    
  
    
   
}
