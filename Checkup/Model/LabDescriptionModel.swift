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

    func fetchLabDes(modelParams : LabDescriptionParams) {
        var skip = modelParams.skip!
        var take = modelParams.take!
        var labId = modelParams.labId!
        var longitude = modelParams.longitude!
        var latitude = modelParams.latitude!
        var governId = modelParams.governId!
        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/GetLabBranchMenus?take=\(take)&skip=\(skip)&latitude=\(latitude)&longitude=\(longitude)&labId=\(labId)&governId=\(governId)").responseJSON { (respone) in
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
