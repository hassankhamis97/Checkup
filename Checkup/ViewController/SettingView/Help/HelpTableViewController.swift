//
//  HelpTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import MessageUI

class HelpTableViewController: UITableViewController ,UITextViewDelegate{

    @IBOutlet weak var problemTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        problemTextView.text="Enter your problem details here...".localized
        problemTextView.textColor=UIColor.lightGray
        problemTextView.font=UIFont(name: "verdana", size: 15.0)
        problemTextView.delegate=self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
               
               view.addGestureRecognizer(tap)
        
        
        problemTextView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                  problemTextView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
                  problemTextView.layer.shadowOpacity = 1.0
                  problemTextView.layer.shadowRadius = 0.0
                  problemTextView.layer.masksToBounds = false
                  problemTextView.layer.cornerRadius = 4.0
        
    }


    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (problemTextView.text=="Enter your problem details here...".localized){
            
        problemTextView.text=""
        problemTextView.textColor=UIColor.black
        problemTextView.font=UIFont(name: "verdana", size: 18.0)
            
        }
        
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text=="\n"{
            problemTextView.resignFirstResponder()
               }
        return true
        }
    

    func textViewDidEndEditing(_ textView: UITextView) {
        if problemTextView.text==""
        {
            problemTextView.text="Enter your problem details here...".localized
            problemTextView.textColor=UIColor.lightGray
            problemTextView.font=UIFont(name: "verdana", size: 15.0)
        }
    }
    

    @IBAction func sendEmailBtn(_ sender: Any) {
        
        let mailComposeViewController=configureMailController()
        if MFMailComposeViewController.canSendMail(){
            
            self.present(mailComposeViewController,animated: true,completion: nil)
        }
        else{
            showMailError()
        }
    }
    
}
