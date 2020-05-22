//
//  LabDescContract.swift
//  Checkup
//
//  Created by Aya on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

protocol ILabDescView {
    func showingDataOnView(labDescObj : Branches)
}


protocol ILabDescPresenter {
    func getDataFromLabDescModel()
    func onSuccess(descObj : Branches)
    func onFail()
}


protocol ILabDescModel {
    func fetchLabDes()
    
}
