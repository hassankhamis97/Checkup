//
//  PdfResultViewController.swift
//  Checkup
//
//  Created by Aya on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import PDFKit
class PdfResultViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    var pdfUrl: String!
    var pdfCounter : Int!
    var noOfPdfObjInArr : Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//         if let path = Bundle.main.path(forResource: "pdf", ofType: "pdf")
//         {
        let url = URL(string: pdfUrl!)!
//            let url = URL(fileURLWithPath: pdfUrl)
            if let pdfDocument = PDFDocument(url: url){
                pdfView.autoScales = true
                pdfView.displayMode = .singlePageContinuous
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
                 
                self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backToPrevious))
            }

//        }
    }
    
    @objc func backToPrevious()  {
        print("ayooya")
        print(pdfCounter)
        print(noOfPdfObjInArr!)
       
        
        if(pdfCounter == noOfPdfObjInArr!){
        
            let popoverContent = self.storyboard?.instantiateViewController(withIdentifier: "ratingPopup")  as! RatingTableViewController
            let nav = UINavigationController(rootViewController: popoverContent)
            nav.modalPresentationStyle = UIModalPresentationStyle.popover
            let popover = nav.popoverPresentationController
            popoverContent.preferredContentSize = CGSize(width: 500,height: 600)
            popover!.delegate = (self as! UIPopoverPresentationControllerDelegate)
            popover!.sourceView = self.view
            popover!.sourceRect = CGRect(x: 100,y: 100,width: 0,height: 0)
            self.present(nav, animated: true, completion: nil)
        
         }
               
               
        self.navigationController?.popViewController(animated: true)
    }
   
}
