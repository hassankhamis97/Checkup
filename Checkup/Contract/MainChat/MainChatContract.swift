//
//  MainChat.swift
//  Checkup
//
//  Created by Aya on 5/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
protocol IMainChatView {
    func dataInView(peared : [PearedUserData])
}

protocol IMainChatPresenenter {
    func getDataFromModel()
    func onSuccess(pearedArr : [PearedUserData])
}

protocol IMainChatModel {
    func readDataFromFirestore()
}
