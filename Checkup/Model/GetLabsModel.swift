//
//  GetLabsModel.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class GetLabsModel: IGetLabsModel {

    func getLabs() {
        // for Azab
    }
    
    var getLabsPresenterRef : IGetLabsPresenter?
    var getFilteredLabsPresenter : IGetFilteredLabsPresenter?
    init(getLabsPresenterRef : IGetLabsPresenter) {
        self.getLabsPresenterRef = getLabsPresenterRef
    }
    init(getFilteredLabsPresenter : IGetFilteredLabsPresenter) {
        self.getFilteredLabsPresenter = getFilteredLabsPresenter
    }
    func getFilteredLabs() {
        var filterLabList = [FilterLab]()
        let urlString = "http://www.checkup.somee.com/api/AnalysisService/GetLaboratories"
            Alamofire.request(urlString).validate().responseJSON { response in
                        debugPrint(response)
                let json = JSON(response.data)
                            print(json)
                            
                                for item in json.arrayValue {
                                    var filterLab = FilterLab()
                                    filterLab.id = item["id"].stringValue
                                    filterLab.name = item["name"].stringValue
                                    filterLab.isChecked = item["isChecked"].boolValue
                                    filterLabList.append(filterLab)
                                }
                self.getFilteredLabsPresenter!.onSuccess(filterLabs: filterLabList)
//                switch response.result {
//                    case .success(let value):
//
//                        let json = JSON(value)
//                        //        let requests = Request.booksFromJSONArray(json.arrayValue)
//                        //        let requests = json.object as! [Request]
//                        if let data = value.data(using: .utf8) {
//                            if let jsonObject = try? JSON(data: data) {
//                                for item in jsonObject.arrayValue {
//                                    var requestObj = Request()
//                                    requestObj.id = item["id"].stringValue
//                                    requestObj.dateRequest = item["dateRequest"].stringValue
//                                    requestObj.labName = item["labName"].stringValue
//                                    requestObj.labPhoto = item["labPhoto"].stringValue
//                                    requestObj.status = item["status"].stringValue
//                                    requests.append(requestObj)
//                                    print(item["dateRequest"].stringValue)
//                                }
//                                self.getRequestsPresenterRef.onSuccess(requests: requests)
//                                print(jsonObject)
//                                // 'jsonObject' contains Json version of 'strJson'
                            
//                                        break
//                                        case .failure(let error):
//                                            self.getRequestsPresenterRef.onFail(message: error.localizedDescription)
//                                            print(error)
//
//                                        }
//                let json = JSON(response.data)
//                            print(json)
//
//                                for item in json["results"].arrayValue {
//                                    var filterLab = FilterLab()
//                                    filterLab.id = item["id"].stringValue
//                                    filterLab.name = item["name"].stringValue
//                                    filterLab.isChecked = item["isChecked"].boolValue
//                                    filterLabList.append(filterLab)
//                                }

    
    }
}
}
