//
//  UpdateCurrentViewMessageContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 6/15/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
//protocol IUpdateCurrentViewMessageView {
//    func renderViewImageMessage()
//}

protocol IUpdateCurrentViewMessagePresenter : IChat{
    func updateCurrentView(pearedId: String , isEntered: Bool)
//    func getData(messageParams: MessageParams, skip : inout QueryDocumentSnapshot)
    func onSuccess()
    func onFail(message: String)
}
