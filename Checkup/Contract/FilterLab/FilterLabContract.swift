//
//  FilterLabContract.swift
//  Checkup
//
//  Created by Aya on 5/26/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

 
 protocol IFilterLabView{
    func returnDataToView(filterLabObjInView : FilterLab)
 }


 protocol IFilterLabPresenter{
    func getDataFromModel(govern : String)
    func onSuccess(filteredDara : FilterLab)
     func onFail()
 }


 protocol IFilterLabModel{
    func fetchFilteredLab(govern : String)
 }


