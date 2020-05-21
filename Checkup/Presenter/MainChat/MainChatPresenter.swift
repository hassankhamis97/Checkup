//
//  MainChatPresenter.swift
//  Checkup
//
//  Created by Aya on 5/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class MainChatPresenter: IMainChatPresenenter {
    
    var model : IMainChatModel!
    var pearedObj : [PearedUserData] = [PearedUserData]()
    var newView : IMainChatView!
  
    
    init(view : IMainChatView){
             newView = view
    }
    
    
    
    func getDataFromModel() {
         model = MainChatModel(presenter: self)
         model.readDataFromFirestore()
        
        
    }
    
    func onSuccess(pearedArr: [PearedUserData]) {
        newView.dataInView(peared: pearedArr)
    }
    
}
