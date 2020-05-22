//
//  ProfilePresenter.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Network

class ProfilePresenter:IProfilePresenter{
  
    var profileView:IProfileView
    
    init(profileView:IProfileView) {
        self.profileView=profileView
    }
    
    func getUser(userId: String)  {
        
         let profileModel=ProfileModel(profilePresenterRef: self)
        let monitor = NWPathMonitor()
        
        monitor.pathUpdateHandler = { pathUpdateHandler in
                   if pathUpdateHandler.status == .satisfied {
                       print("Internet connection is on.")
                       
                       DispatchQueue.main.async {
                           
                        self.profileView.showIndicator()
                       
                           
                       }
                    
                     profileModel.getUser(userId: userId)
                      
                    
            }
                   else{
                    DispatchQueue.main.async {
                                              
                                           print("There's no internet connection.")
                                                              self.profileView.errorMessage(msg: "No internet connection")
                                          
                                              
                                          }
                    
                      
            }
        
    
    }
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
                    monitor.start(queue: queue)

    }
    
    
    
    
    func onSuccess(user:User) {
        profileView.hideIndicator()
        profileView.renderProfileView(user: user)
        
    }
    
    func onFail(message: String) {
        profileView.hideIndicator()
        profileView.errorMessage(msg: message)
    }
    
 
}
