//
//  FilterLabContract.swift
//  Checkup
//
//  Created by Aya on 5/26/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

 
 protocol IFilterLabView{
     func showDataToView()
 }


 protocol IFilterLabPresenter{
     func getDataFromModel()
     func onSuccess()
     func onFail()
 }


 protocol IFilterLaModel{
    func fetchFilteredLab()
 }


