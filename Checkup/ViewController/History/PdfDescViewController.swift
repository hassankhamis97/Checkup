//
//  PdfDescViewController.swift
//  Checkup
//
//  Created by Aya on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class PdfDescViewController: UIViewController {
    @IBOutlet weak var pdfDescTable: UITableView!
    
    @IBOutlet weak var descriptionView: UITextView!
    var pdfsArr : [String] = ["El-Mokhtabar's pdf" , "Alfa' pdf" , "El-Borg's pdf"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension PdfDescViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pdfsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "pdfDesccell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/checkup-23ffe.appspot.com/o/TestResults%2F-M5j2KV4Wz74yZfJY1Dr%2FDesign%20Principles%20and%20Patterns%20-%20Full.pdf?alt=media&token=f46ad9a4-b56c-4873-91a1-cd7c32c13e0a") {
//            UIApplication.shared.open(url)
//        }
        
        let pdfHistory = storyboard?.instantiateViewController(withIdentifier: "pdfHistory") as! PdfResultViewController
        pdfHistory.pdfUrl = "https://firebasestorage.googleapis.com/v0/b/checkup-23ffe.appspot.com/o/TestResults%2F-M5j2KV4Wz74yZfJY1Dr%2FDesign%20Principles%20and%20Patterns%20-%20Full.pdf?alt=media&token=f46ad9a4-b56c-4873-91a1-cd7c32c13e0a"
        navigationController?.pushViewController(pdfHistory, animated: true)
    }
}
