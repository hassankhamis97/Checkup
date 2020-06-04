//
//  ExtensionHelpTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
extension HelpTableViewController:MFMailComposeViewControllerDelegate,IView{
    
    
    
    
    
    
    
    func configureMailController()->MFMailComposeViewController{
        
        let mailComposerVC=MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate=self
        mailComposerVC.setToRecipients(["checkupteam5@gmail.com"])
        mailComposerVC.setSubject("Customer's Problem")
        
        if let messageBody=problemTextView.text{
            
            if messageBody.count<=0 || messageBody=="Enter your problem details here...".localized{
                Alert.showSimpleAlert(title: "sorry", message: "Enter your problem please", viewRef: self)
            }
            else{
                 mailComposerVC.setMessageBody(messageBody, isHTML: false)
            }
           
        }
       
        return mailComposerVC
    }
    
    
    
    func showMailError(){
        
        
        
        Alert.showSimpleAlert(title: "Couldn't send email".localized, message: "Your device couldn't send email", viewRef: self)
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.presentingViewController?.dismiss(animated: true, completion:{
        
            self.navigationController?.popViewController(animated: true)
        })
    }
}

