//
//  BranchDetailsModel.swift
//  Checkup
//
//  Created by Aya on 5/22/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire


class BranchDescModel : IBranchDescModel {
    
    var newBranchPresenter : IBranchDescPresenter
    init(presenter : IBranchDescPresenter) {
        newBranchPresenter = presenter
    }
    
    
    func fetchBranchDesc() {
        
        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/GetFullInfoLabBranches?fireBaseLabId=IaTcOwrdXhVBa7qx40FOkW5b94J3").responseJSON { (response) in
            if let JSON = response.result.value{
                print("lab Description")
                print(JSON)
                
                do{
                    let brachDescObj = try JSONDecoder().decode(BranchDescription.self , from: response.data!)
                
                    print(brachDescObj)
                    print("aya")
                    self.newBranchPresenter.onSuccess(branchDescObj: brachDescObj)
                }catch{
                    
                }
            }
          
            
        }
    }
    
}
