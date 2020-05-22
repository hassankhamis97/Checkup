//
//  LabDescContract.swift
//  Checkup
//
//  Created by Aya on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

protocol ILabDescView {
    func showingDataOnView()
}


protocol ILabDescPresenter {
    func onSuccess()
    func onFail()
}


protocol ILabDescModel {
    func fetchLabDes()
    
}
