//
//  InternetConnection.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/23/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Network


class InternetConnection {
    
    
    class func checkInternetConnection(iCheckConnection:ICheckConnection){
    
        
      
        
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
                      

           
           monitor.pathUpdateHandler = { pathUpdateHandler in
                      if pathUpdateHandler.status == .satisfied {
                          print("Internet connection is on.")
                        
                    
                        
                        
                        DispatchQueue.main.async {
                        
                            iCheckConnection.onSucessfullyConnected()
                        
                                               }
                        
                        
                      }
                      else{
               
                      DispatchQueue.main.async {
                                            
                                                iCheckConnection.onFailConnected()
                                            
                                                                   }
                         
               }
           
       
       }
            monitor.start(queue: queue)
    


       }
       
    
    
    
    
    
    
    
    


    
    
    
}


