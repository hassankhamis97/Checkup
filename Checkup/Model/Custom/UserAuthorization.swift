//
//  UserAuthorization.swift
//  Checkup
//
//  Created by kasper on 6/7/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
class UserAuthorization {
 
       
       
       class func check( ) -> Bool{
           
           var isExists = false
       
    
              if(Auth.auth().currentUser?.uid != nil )
              {
                  
                    isExists = true

              }
              
           return isExists
          }
           
    
    
}
