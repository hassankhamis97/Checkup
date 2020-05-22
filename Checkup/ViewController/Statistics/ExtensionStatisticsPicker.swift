//
//  ExtensionStatisticsPicker.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
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
           
           yearTextField.text=yearArray[row]
           yearTextField.resignFirstResponder()
       }
    
    
    
    
    
    
    
    
    
}
