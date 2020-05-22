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
    
    func getLabs() {
        
        //check internet Connection
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        let realm = try! Realm()
        
        // for Azab
        var labs = [HomeLab]()
        let lab1 = HomeLab(idFB: "sa504", hotline: "457891264", labPhoto: "mokhtabar", labName: "El-Mokhtabar", rating: "3.6")
        let lab2 = HomeLab(idFB: "sa514", hotline: "4564", labPhoto: "alpha", labName: "Alpha", rating: "2.6")
        let lab3 = HomeLab(idFB: "sa542", hotline: "456d84", labPhoto: "borg", labName: "borg", rating: "1.6")
        let lab4 = HomeLab(idFB: "sa543", hotline: "45d654", labPhoto: "mokhtabar", labName: "mokhtabar", rating: "3")
        labs.append(lab1)
        labs.append(lab2)
        labs.append(lab3)
        labs.append(lab4)
        
        // delete all objects from realm
        try! realm.write {
            realm.deleteAll()
        }
        
        // write all objects to realm
        realm.beginWrite()
        
        for lab in labs
        {
            let labR = HomeLabRealm()
            labR.idFB = lab.idFB ?? "1"
            labR.labName = lab.labName ?? ""
            labR.labPhoto = lab.labPhoto ?? ""
            labR.hotline = lab.hotline ?? ""
            labR.rating = lab.rating ?? "0"
            realm.add(labR)
        }
        
        try! realm.commitWrite()
        
        // fetch data from realm
        var savedLabs = [HomeLab]()
        //fetch from Realm
        let realmHomeLabs = realm.objects(HomeLabRealm.self)
        for rLab in realmHomeLabs
        {
            var hLab = HomeLab()
            hLab.idFB = rLab.idFB
            hLab.labName = rLab.labName
            hLab.labPhoto = rLab.labPhoto
            hLab.hotline = rLab.hotline
            hLab.rating = rLab.rating
            savedLabs.append(hLab)
        }
        
        //check internet Connection
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                
                print("Internet connection is on.")
                self.getLabsPresenterRef?.onSuccess(homeLabs: labs)
                
            } else {
                print("There's no internet connection.")
                
                self.getLabsPresenterRef?.onSuccess(homeLabs: savedLabs)
            }
        }
        
        monitor.start(queue: queue)
        
        
    }
    
    func getFilteredLabs() {
        var filterLabList = [FilterLab]()
        let urlString = "http://www.checkup.somee.com/api/AnalysisService/GetLaboratories"
        Alamofire.request(urlString).validate().responseJSON { response in
            debugPrint(response)
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
            let json = JSON(response.data)
            print(json)
            
            for item in json["results"].arrayValue {
                var filterLab = FilterLab()
                filterLab.id = item["id"].stringValue
                filterLab.name = item["name"].stringValue
                filterLab.isChecked = item["isChecked"].boolValue
                filterLabList.append(filterLab)
            }
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
}
