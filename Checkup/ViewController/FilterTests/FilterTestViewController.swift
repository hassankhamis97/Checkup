//
//  FilterTestViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class FilterTestViewController: UIViewController,IView {
    @IBOutlet var tableViewOutlet: UITableView!
    var testFilter : TestFilter?
    var datePickerView : UIDatePicker = UIDatePicker()
    var datePickerView2 : UIDatePicker = UIDatePicker()
    var parentRef : IFilterTest?
    var dateFormatter = DateFormatter()
    var labsList = [FilterLab]()
    var isWaitingData = false
    var errorMsg = ""
    @IBOutlet weak var firstDateField: SkyFloatingLabelTextField!
    @IBOutlet weak var secDateField: SkyFloatingLabelTextField!
    var inputDateOne : String!
    var inputDateTwo : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        testFilter?.dateFrom = nil
        testFilter?.dateTo = nil
        var getFilteredLabsPresenter = GetFilteredLabsPresenter(getFilteredLabsViewRef: self)
        getFilteredLabsPresenter.getFilteredLabs()
        testFilter?.labIds = [String]()
//        filterType = FilterStatus.noFilter.rawValue
        firstDateField.inputView = datePickerView
         datepickerToolBar()
         
         secDateField.inputView = datePickerView2
         datepickerToolBar2()
         
         dateFormatter.dateStyle = .medium
         dateFormatter.timeStyle = .none
         datePickerView.datePickerMode = .date
         datePickerView2.datePickerMode = .date
//                 datePickerView2.alpha = 0
        datePickerView2.isEnabled = false
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Apply", style: .plain, target: self, action: #selector(applyFilter))
        
        let backButton = UIBarButtonItem()
        backButton.title = "cancel filter"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        // Do any additional setup after loading the view.
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
        testFilter?.dateFrom = inputDateOne
        datePickerView2.minimumDate = datePickerView.date
//                 datePickerView2.alpha = 1
        datePickerView2.isEnabled = true
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
        testFilter?.dateTo = inputDateTwo

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
    @objc func applyFilter(){
        if(testFilter?.dateFrom == nil && testFilter?.dateTo == nil && testFilter?.labIds?.count == 0)
        {
            Alert.showSimpleAlert(title: "sorry", message: "please enter at least date range or lab to filter data", viewRef: self)
        }
        else if((testFilter?.dateFrom != nil && testFilter?.dateTo == nil) || (testFilter?.dateFrom == nil && testFilter?.dateTo != nil))
        {
            Alert.showSimpleAlert(title: "sorry", message: "please insert another date", viewRef: self)
        }
//        else if testFilter?.labIds?.count == 0
//        {
//            Alert.showSimpleAlert(title: "sorry", message: "please insert another date", viewRef: self)
//        }
        else {
//        if(testFilter?.dateFrom ==)
        testFilter?.skip = 0
        testFilter?.take = 200
        testFilter?.isFilter = true
        parentRef!.getTestFilter(testFilter: testFilter!)
        navigationController?.popViewController(animated: true)
        }
    }
}
