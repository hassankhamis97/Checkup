//
//  ExtensionStatisticsPicker.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
import Firebase
extension StatisticsTableViewController:UIPickerViewDelegate,UIPickerViewDataSource {
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return yearArray.count
       }
       
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return yearArray[row]
       }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
        index=row
    
       }
    
    
    
    
    
    
    
    
    func createDatePicker(){
           
           let toolbar=UIToolbar()
           toolbar.sizeToFit()
        
           let doneBtn=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:#selector(donePressed))
           toolbar.setItems(([doneBtn]), animated: true)
           yearTextField.inputAccessoryView=toolbar
           yearTextField.inputView=yearPickerView

           
       }
       
    @objc func donePressed(){
        if let ind=index{
            if index==0{
                 yearTextField.text=""
            }
            else{
                  yearTextField.text=yearArray[index]
                let selectedYear = yearTextField.text
                
                let statisticsPresenterRef=StatisticPresenter(statisticsViewRef: self)
                
                statisticsPresenterRef.getSample(userId: Auth.auth().currentUser!.uid, year: selectedYear!)
            }
        }
        else{
            yearTextField.text=""
        }
      

         self.view.endEditing(true)
//
       }
       
    
//    func getTheIndex()->Int{
//        
//        return self.index
//    }
    
    
    
    
}
