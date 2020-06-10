//
//  LanguageTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 6/5/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import MOLH

class LanguageTableViewController: UITableViewController ,IView{
    
    @IBOutlet weak var chooseLanguageLabel: UILabel!
    var btnArray=[UIButton]()
    @IBOutlet weak var arabicLangBtn: RadioButtonOutlet!
    
    
    @IBOutlet weak var englishLangBtn: RadioButtonOutlet!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseLanguageLabel.text="Choose Language".localized
        btnArray=[arabicLangBtn,englishLangBtn]
        
        setFuncAndTagToBtn(btnArray: btnArray, tag: 1)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        var x =  LocalizationSystem.sharedInstance.getLanguage()
        print(x)
        
        if x=="ar"
        {
            
            arabicLangBtn.isSelected=true
            arabicLangBtn.backgroundColor = .systemTeal
        }
            
        else if x=="en"
        {
            
            englishLangBtn.isSelected=true
            englishLangBtn.backgroundColor = .systemTeal
        }
        
    }
    
    
    func setFuncAndTagToBtn(btnArray:[UIButton],tag:Int)
    {
        var tag = tag
        for btn in btnArray{
            
            btn.tag=tag
            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            tag+=1
            
            
            
        }
        
        
    }
    
    
    @objc func buttonAction(sender: UIButton!){
        
        
        
        for button in btnArray{
            button.isSelected = false
            button.backgroundColor = .clear
        }
        
        sender.isSelected = true
        sender.pulsate()
        sender.backgroundColor = UIColor.systemTeal
        if sender.tag==1{
            print ("arabic")
            
            
            
            let alertController = UIAlertController(title: "Language".localized, message: "To changing language you need to restart application, do you want to restart?".localized
                , preferredStyle: .alert)
            
            
            
            alertController.addAction(UIAlertAction(title: "Yes".localized, style: UIAlertAction.Style.default) {
                UIAlertAction in
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "ar")
            
                self.restartApplication()
              
                
                
            })
            
            alertController.addAction(UIAlertAction(title: "No".localized, style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.dismiss(animated: true, completion: nil)
            })
            
            self.present(alertController, animated: true)
            
            
        }
        else if sender.tag==2{
            print ("english")
            
            
            let alertController = UIAlertController(title: "Language".localized, message: "To changing language you need to restart application, do you want to restart?".localized
                , preferredStyle: .alert)
            
            
            
            alertController.addAction(UIAlertAction(title: "Yes".localized, style: UIAlertAction.Style.default) {
                UIAlertAction in

                MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "ar" ? "en" : "en")
                
                  self.restartApplication()
                //MOLH.reset()
            })
            
            alertController.addAction(UIAlertAction(title: "No".localized, style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.dismiss(animated: true, completion: nil)
            })
            
            self.present(alertController, animated: true)
            
            
        }
    
    }
    
    
    
    func restartApplication () {
        let launchScreen = UIStoryboard(name: "SplashScreen", bundle: nil)
        var tableViewController = launchScreen.instantiateViewController(withIdentifier: "splashSVC") as! SplashScreenViewController

        let navCtrl = UINavigationController(rootViewController: tableViewController)
        //
        guard
            let window = UIApplication.shared.keyWindow,
            let rootViewController = window.rootViewController
            else {
                return
        }
 

        navCtrl.setNavigationBarHidden(true, animated: true)
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            window.rootViewController = navCtrl
        })

    }
    
}

