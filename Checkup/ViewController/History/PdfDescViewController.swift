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
        let pdfHistory = storyboard?.instantiateViewController(withIdentifier: "pdfHistory") as! PdfResultViewController
        navigationController?.pushViewController(pdfHistory, animated: true)
    }
}
