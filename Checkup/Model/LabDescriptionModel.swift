//
//  LabaDescriptionModel.swift
//  Checkup
//
//  Created by Aya on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire

class LabaDescriptionModel: ILabDescModel {
    var newDescPresenter : ILabDescPresenter
    init(descPreseneter : ILabDescPresenter) {
        newDescPresenter = descPreseneter
    }

    func fetchLabDes() {
  
        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/GetLabBranchMenus?take=5&skip=0&latitude=31.1803167&longitude=29.9137701&labId=-M7O-IStoBsiYrQFpwo_&governId=1").responseJSON { (respone) in
            if let JSON = respone.result.value{
                print("lab description ")

                
                print(JSON)
                do{
                let labDescObj = try JSONDecoder().decode(Branches.self, from: respone.data!)
                    print(labDescObj)
                    self.newDescPresenter.onSuccess(descObj: labDescObj)
                }
                catch{
                    
                }
                
                
                
                }
        }
    }
    
    
}
