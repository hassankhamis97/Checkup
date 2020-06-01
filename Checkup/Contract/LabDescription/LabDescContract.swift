//
//  LabDescContract.swift
//  Checkup
//
//  Created by Aya on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

protocol ILabDescView : IBase {
    func showingDataOnView(labDescObj : Branches , id: Int)
}


protocol ILabDescPresenter {
    func getDataFromLabDescModel(params : LabDescriptionParams)
    func onSuccess(descObj : Branches , id : Int)
    func onFail()
}


protocol ILabDescModel {
    func fetchLabDes(modelParams : LabDescriptionParams)
    
}
