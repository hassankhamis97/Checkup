//
//  BranchDescContract.swift
//  Checkup
//
//  Created by Aya on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation


protocol IBranchDescView{
    func showDataToView()
}


protocol IBranchDescPresenter{
    func onSuccess()
    func onFail()
}


protocol IBranchDescModel{
    func fetchBranchDesc()
}
