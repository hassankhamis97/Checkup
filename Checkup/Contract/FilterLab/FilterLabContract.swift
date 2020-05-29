//
//  FilterLabContract.swift
//  Checkup
//
//  Created by Aya on 5/26/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

 
 protocol IFilterLabView{
    func returnDataToView(filterLabArrInView : [FilterGovern])
 }


 protocol IFilterLabPresenter{
    func getDataFromModel()
    func onSuccess(filteredData : [FilterGovern])
     func onFail()
 }


 protocol IFilterLabModel{
    func fetchFilteredLab()
 }


