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
                
            }

//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
