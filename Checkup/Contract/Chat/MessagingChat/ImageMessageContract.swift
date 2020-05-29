//
//  ImageMessageContract.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IImageMessageView {
    func renderViewImageMessage()
}

protocol IImageMessagePresenter : IChat{
    func saveMessage(imageMessage: ImageMessage)
//    func getData(messageParams: MessageParams, skip : inout QueryDocumentSnapshot)
    func onSuccess()
    func onFail(message: String)
}
