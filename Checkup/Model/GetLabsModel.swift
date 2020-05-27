//
//  GetLabsModel.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire
import Network
import SwiftyJSON
import RealmSwift

class GetLabsModel: IGetLabsModel {
    func getSearchedLabs(name: String) {
        let homeLabsURL = "http://www.checkup.somee.com/api/AnalysisService/GetLabMenus?searchName="+name
        
        // for Azab
        var labs = [HomeLab]()
        Alamofire.request(homeLabsURL).validate().responseJSON { response in
            
            let json = JSON(response.data)
            
            for item in json.arrayValue {
                var homeLab = HomeLab()
                homeLab.idFB = item["idFB"].stringValue
                homeLab.labPhoto = item["labPhoto"].stringValue
                homeLab.labName = item["labName"].stringValue
                homeLab.hotline = item["hotline"].stringValue
                homeLab.rating = item["rating"].stringValue
                labs.append(homeLab)
            }
            self.getLabsPresenterRef?.onSuccess(homeLabs: labs, str:"search")
        }
    }
    
    
    var getLabsPresenterRef : IGetLabsPresenter?
    var getFilteredLabsPresenter : IGetFilteredLabsPresenter?
    init(getLabsPresenterRef : IGetLabsPresenter) {
        self.getLabsPresenterRef = getLabsPresenterRef
    }
    init(getFilteredLabsPresenter : IGetFilteredLabsPresenter) {
        self.getFilteredLabsPresenter = getFilteredLabsPresenter
    }
    /*
     var labNames = ["El-Mokhtabar" , "Alpha" , "El-Borg" , "El-Mokhtabar"]
     var labImages = ["mokhtabar" , "alpha" , "borg" ,"mokhtabar" ]
     var labDate = ["21/2/2005" , "1/11/2019" , "5/9/2008" , "8/6/2016"]
     */
    
    func getLabs(take: Int, skip: Int) {
        
        //URL for Labs
        let homeLabsURL = "http://www.checkup.somee.com/api/AnalysisService/GetLabMenus?take="+String(take)+"&skip="+String(skip)
        
        // for Azab
        var labs = [HomeLab]()
        //        Alamofire.request(homeLabsURL).responseJSON { (responseData) -> Void in
        Alamofire.request(homeLabsURL).validate().responseJSON { response in
            
            let json = JSON(response.data)
            
            for item in json.arrayValue {
                var homeLab = HomeLab()
                homeLab.idFB = item["idFB"].stringValue
                homeLab.labPhoto = item["labPhoto"].stringValue
                homeLab.labName = item["labName"].stringValue
                homeLab.hotline = item["hotline"].stringValue
                homeLab.rating = item["rating"].stringValue
                labs.append(homeLab)
            }
            self.getLabsPresenterRef?.onSuccess(homeLabs: labs, str:"filtered")
        }
    }
    
    //    func getFilteredLabs() {
    //        var filterLabList = [FilterLab]()
    //        let urlString = "http://www.checkup.somee.com/api/AnalysisService/GetLaboratories"
    //        Alamofire.request(urlString).validate().responseJSON { response in
    //            debugPrint(response)
    //            //                switch response.result {
    //            //                    case .success(let value):
    //            //
    //            //                        let json = JSON(value)
    //            //                        //        let requests = Request.booksFromJSONArray(json.arrayValue)
    //            //                        //        let requests = json.object as! [Request]
    //            //                        if let data = value.data(using: .utf8) {
    //            //                            if let jsonObject = try? JSON(data: data) {
    //            //                                for item in jsonObject.arrayValue {
    //            //                                    var requestObj = Request()
    //            //                                    requestObj.id = item["id"].stringValue
    //            //                                    requestObj.dateRequest = item["dateRequest"].stringValue
    //            //                                    requestObj.labName = item["labName"].stringValue
    //            //                                    requestObj.labPhoto = item["labPhoto"].stringValue
    //            //                                    requestObj.status = item["status"].stringValue
    //            //                                    requests.append(requestObj)
    //            //                                    print(item["dateRequest"].stringValue)
    //            //                                }
    //            //                                self.getRequestsPresenterRef.onSuccess(requests: requests)
    //            //                                print(jsonObject)
    //            //                                // 'jsonObject' contains Json version of 'strJson'
    //
    //            //                                        break
    //            //                                        case .failure(let error):
    //            //                                            self.getRequestsPresenterRef.onFail(message: error.localizedDescription)
    //            //                                            print(error)
    //            //
    //            //                                        }
    //            let json = JSON(response.data)
    //            print(json)
    //
    //            for item in json["results"].arrayValue {
    //                var filterLab = FilterLab()
    //                filterLab.id = item["id"].stringValue
    //                filterLab.name = item["name"].stringValue
    //                filterLab.isChecked = item["isChecked"].boolValue
    //                filterLabList.append(filterLab)
    //            }
    //        }
    
    func getFilteredLabs() {
        var filterLabList = [FilterLab]()
        let urlString = "http://www.checkup.somee.com/api/AnalysisService/GetLaboratories"
        Alamofire.request(urlString).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                debugPrint(response)
                let json = JSON(response.data)
                print(json)
                
                for item in json.arrayValue {
                    var filterLab = FilterLab()
                    filterLab.id = item["fireBaseId"].stringValue
                    filterLab.name = item["name"].stringValue
                    filterLab.isChecked = false
                    filterLabList.append(filterLab)
                }
                self.getFilteredLabsPresenter!.onSuccess(filterLabs: filterLabList)
                break
            case .failure(let error):
                self.getFilteredLabsPresenter!.onFail(message: error.localizedDescription)
                print(error)
                break
            }
//            self.getFilteredLabsPresenter!.onSuccess(filterLabs: filterLabList)
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

