//
//  FilterTestViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class FilterTestViewController: UIViewController {
    var testFilter : TestFilter?
    var datePickerView : UIDatePicker = UIDatePicker()
    var datePickerView2 : UIDatePicker = UIDatePicker()
    
    var dateFormatter = DateFormatter()
    var labsList = [FilterLab]()
    @IBOutlet weak var firstDateField: SkyFloatingLabelTextField!
    @IBOutlet weak var secDateField: SkyFloatingLabelTextField!
    var inputDateOne : String!
    var inputDateTwo : String!
    override func viewDidLoad() {
        super.viewDidLoad()
//        filterType = FilterStatus.noFilter.rawValue
        firstDateField.inputView = datePickerView
         datepickerToolBar()
         
         secDateField.inputView = datePickerView2
         datepickerToolBar2()
         
         dateFormatter.dateStyle = .medium
         dateFormatter.timeStyle = .none
         datePickerView.datePickerMode = .date
         datePickerView2.datePickerMode = .date
         
        
        var labObj1 = FilterLab(id: "1", name: "mokhtabar", isChecked: false)
        var labObj2 = FilterLab(id: "2", name: "mokhtabar", isChecked: true)
        labsList.append(labObj1)
        labsList.append(labObj2)
         
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Apply", style: .plain, target: self, action: #selector(closeTapped))
        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
