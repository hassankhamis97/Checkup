//
//  FilterTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/10/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class FilterTableViewController: UITableViewController {
    var checkedOne : Bool = false
    var checkedTwo : Bool = false
    var checkedThree : Bool = false
    var checkedFour : Bool = false
    
    var datePickerView : UIDatePicker = UIDatePicker()
    var datePickerView2 : UIDatePicker = UIDatePicker()
    
    var dateFormatter = DateFormatter()
    
    var inputDateOne : String!
    var inputDateTwo : String!
    
    @IBOutlet weak var firstDateField: SkyFloatingLabelTextField!
    @IBOutlet weak var secDateField: SkyFloatingLabelTextField!
    
    
    
    
    
    @IBAction func radioBtnOne(_ sender: UIButton) {
        sender.pulsate()
        
        if (checkedOne == false){
            sender.setImage(UIImage(named: "checked"), for: .normal)
            sender.imageView?.contentMode = .scaleToFill
            checkedOne = true
            self.tableView.reloadData()
        }else{
            
          sender.setImage(UIImage(named: "unchecked"), for: .normal)
            sender.imageView?.contentMode = .scaleToFill

            checkedOne = false
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func radioBtnTwo(_ sender: UIButton) {
        sender.pulsate()
             if (checkedTwo == false){
                 sender.setImage(UIImage(named: "checked"), for: .normal)
                 sender.imageView?.contentMode = .scaleToFill
                 checkedTwo = true
                 self.tableView.reloadData()
             }else{
                 
               sender.setImage(UIImage(named: "unchecked"), for: .normal)
                 sender.imageView?.contentMode = .scaleToFill

                 checkedTwo = false
                 self.tableView.reloadData()
             }
    }
    
    
    @IBAction func radioBtnThree(_ sender: UIButton) {
        sender.pulsate()
        if (checkedThree == false){
            sender.setImage(UIImage(named: "checked"), for: .normal)
            sender.imageView?.contentMode = .scaleToFill
            checkedThree = true
            self.tableView.reloadData()
            }else{
            
            sender.setImage(UIImage(named: "unchecked"), for: .normal)
            sender.imageView?.contentMode = .scaleToFill
            checkedThree = false
            self.tableView.reloadData()
        }
    }
    
    @IBAction func radioBtnFour(_ sender: UIButton) {
        sender.pulsate()
      //  isCheked(sender: sender, check: checkedFour)
        if (checkedFour == false){
            sender.setImage(UIImage(named: "checked"), for: .normal)
            sender.imageView?.contentMode = .scaleToFill
            checkedFour = true
            self.tableView.reloadData()
            }else{
            
            sender.setImage(UIImage(named: "unchecked"), for: .normal)
            sender.imageView?.contentMode = .scaleToFill
            checkedFour = false
            self.tableView.reloadData()
        }
    }
    
    
    /*
    @IBAction func secDoneBtn(_ sender: UIButton) {
        sender.pulsate()
              inputDateTwo = dateFormatter.string(from: datePickerView2.date)
              secDateField.text = inputDateTwo
              datePickerView2.removeFromSuperview()
    }
 
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        firstDateField.inputView = datePickerView
        datepickerToolBar()
        
        secDateField.inputView = datePickerView2
        datepickerToolBar2()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
       
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Apply", style: .plain, target: self, action: #selector(closeTapped))
         
 
 
         }
   @objc func closeTapped(){
          navigationController?.popViewController(animated: true)
      }

    
    func datepickerToolBar(){
        let toolBar  = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(done))
        toolBar.setItems([doneBtn], animated: true)
        
        firstDateField.inputAccessoryView = toolBar
    
    }
    
     @objc func done(){
        inputDateOne = dateFormatter.string(from: datePickerView.date)
             firstDateField.text = inputDateOne
             datePickerView.removeFromSuperview()
        self.view.endEditing(true)
    

    }
    
    
    
    
    
    func datepickerToolBar2(){
          let toolBar  = UIToolbar()
          toolBar.sizeToFit()
          toolBar.barStyle = UIBarStyle.default
          toolBar.isTranslucent = true
          let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(done2))
          toolBar.setItems([doneBtn], animated: true)
          secDateField.inputAccessoryView = toolBar
      }
      
       @objc func done2(){
          inputDateTwo = dateFormatter.string(from: datePickerView2.date)
          secDateField.text = inputDateTwo
          datePickerView2.removeFromSuperview()
        self.view.endEditing(true)

      }

}
