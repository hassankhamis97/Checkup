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
//        var governId = 15
        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/GetLabBranchMenus?take=\(take)&skip=\(skip)&latitude=\(latitude)&longitude=\(longitude)&labId=\(labId)&governId=\(governId)").responseJSON { (response) in
            switch response.result {
            case .success(_):
            if let JSON = response.result.value{
                print("lab description ")

                
                print(JSON)
                do{
                let labDescObj = try JSONDecoder().decode(Branches.self, from: response.data!)
                    print(labDescObj)
//                    if labDescObj.branches!.count > 0 {
                    self.newDescPresenter.onSuccess(descObj: labDescObj , id: governId)
//                    }
//                    else {
//                        self.newDescPresenter.onFail(msg: "There is no data")
//                    }
                }
                catch{
                    
                }
                
                
                
                }
                break
                case .failure(let error):
                    self.newDescPresenter.onFail(msg: "An error occured please try again later")
                break
            }
        }
    }
    
    
}
