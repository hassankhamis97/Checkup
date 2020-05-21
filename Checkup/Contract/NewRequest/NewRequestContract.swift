//
//  NewRequestContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
protocol INewRequestView : IBase {
    func updateView ()
}
protocol INewRequestPresenter {
    func saveRequest(testObj: Test,roushettaImages: [UIImage])
    func onSuccess()
    func onFail(message: String)
}
protocol INewRequestModel {
    func saveRequest(testObj: Test,roushettaImages: [UIImage])
}
