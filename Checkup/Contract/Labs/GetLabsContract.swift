//
//  GetLabsContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IGetLabsView : IBase {
    // for Azab
    func getLabsForRender(homeLabs: [HomeLab])
    func getSearchedLabs(seachedHomeLabs: [HomeLab])
}
protocol IGetLabsPresenter {                // for Azab
    func getLabs(take: Int, skip: Int) // edit here as you want
    func getSearchedLabs(name: String)
    func onSuccess(homeLabs: [HomeLab], str: String)
    func onFail(message: String)
}
protocol IGetFilteredLabsView : IBase {
    func updateView (filterLabs: [FilterLab])
}
protocol IGetFilteredLabsPresenter {
    func getFilteredLabs()
    func onSuccess(filterLabs: [FilterLab])
    func onFail(message: String)
}
protocol IGetLabsModel {
    func getFilteredLabs()
    func getLabs(take: Int, skip: Int) // edit here as you want
    func getSearchedLabs(name: String)
}

