//
//  GetRequests.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

import Firebase
import FirebaseFirestore
import Alamofire
import SwiftyJSON
class GetRequestsModel: IGetRequestsModel {
    
    var ref: DatabaseReference!
    var getRequestsPresenterRef : IGetRequestsPresenter
    let db : Firestore?
    
    init(getRequestsPresenterRef : IGetRequestsPresenter) {
        self.getRequestsPresenterRef = getRequestsPresenterRef
        ref = Database.database().reference()
        db = Firestore.firestore()
        
    }
    func getRequests(testFilter: TestFilter) {
        //        var x = RequestConfigration(userId: Auth.auth().currentUser?.uid, status: ["PendingForLabConfirmation" , "Done"], take: 3, skip: 0)
        var requests = [Request]()
        let testFilterDic = try! DictionaryEncoder.encode(testFilter)
        let urlString : String
        if(testFilter.isFilter!)
        {
//            let urlString = "http://www.checkup.somee.com/api/AnalysisService/ClientAnalysisFilterRequests"
            urlString = "http://192.168.1.2:3000/api/AnalysisService/ClientAnalysisFilterRequests"
        }else{
            
            urlString = "http://www.checkup.somee.com/api/AnalysisService/ClientAnalysisRequests"
//            let urlString = "http://www.checkup.somee.com/api/AnalysisService/ClientAnalysisRequests"
        }

        
        Alamofire.request(urlString, method: .post, parameters: testFilterDic,encoding: JSONEncoding.default, headers: nil).responseString {
            response in
            switch response.result {
                //                                    case .success:
            //                                        print(response)
            case .success(let value):
                let json = JSON(value)
                //        let requests = Request.booksFromJSONArray(json.arrayValue)
                //        let requests = json.object as! [Request]
                if let data = value.data(using: .utf8) {
                    if let jsonObject = try? JSON(data: data) {
                        for item in jsonObject.arrayValue {
                            var requestObj = Request()
                            requestObj.id = item["id"].stringValue
                            requestObj.dateRequest = item["dateRequest"].stringValue
                            requestObj.labName = item["labName"].stringValue
                            requestObj.labPhoto = item["labPhoto"].stringValue
                            requestObj.status = item["status"].stringValue
                            requests.append(requestObj)
                            print(item["dateRequest"].stringValue)
                        }
                        self.getRequestsPresenterRef.onSuccess(requests: requests)
                        print(jsonObject)
                        // 'jsonObject' contains Json version of 'strJson'
                    }
                }
                print("JSON: \(json)")
                
                break
            case .failure(let error):
                self.getRequestsPresenterRef.onFail(message: error.localizedDescription)
                print(error)
            }
        }
        func getFilterLabs() {
        //        var x = RequestConfigration(userId: Auth.auth().currentUser?.uid, status: ["PendingForLabConfirmation" , "Done"], take: 3, skip: 0)
        var requests = [Request]()
        let testFilterDic = try! DictionaryEncoder.encode(testFilter)
        let urlString = "http://www.checkup.somee.com/api/AnalysisService/GetLaboratories"
        
        Alamofire.request(urlString, method: .post, parameters: testFilterDic,encoding: JSONEncoding.default, headers: nil).responseString {
            response in
            switch response.result {
                //                                    case .success:
            //                                        print(response)
            case .success(let value):
                let json = JSON(value)
                //        let requests = Request.booksFromJSONArray(json.arrayValue)
                //        let requests = json.object as! [Request]
                if let data = value.data(using: .utf8) {
                    if let jsonObject = try? JSON(data: data) {
                        for item in jsonObject.arrayValue {
                            var requestObj = Request()
                            requestObj.id = item["id"].stringValue
                            requestObj.dateRequest = item["dateRequest"].stringValue
                            requestObj.labName = item["labName"].stringValue
                            requestObj.labPhoto = item["labPhoto"].stringValue
                            requestObj.status = item["status"].stringValue
                            requests.append(requestObj)
                            print(item["dateRequest"].stringValue)
                        }
                        self.getRequestsPresenterRef.onSuccess(requests: requests)
                        print(jsonObject)
                        // 'jsonObject' contains Json version of 'strJson'
                    }
                }
                print("JSON: \(json)")
                
                break
            case .failure(let error):
                self.getRequestsPresenterRef.onFail(message: error.localizedDescription)
                print(error)
            }
        }
        //
        ////        .orderByChild("status").startAt("PendingForLabConfirmation").endAt("Done")
        //        var requests = [Request]()
        //
        ////        .whereField("userId", isEqualTo: "gLcrV5nCzhREMdrgH57eDfRanr22").order(by: "userId")
        ////        let docRef = db!.collection("TestsHassan").document("IaTcOwrdXhVBa7qx40FOkW5b94J3").collection("IaTcOwrdXhVBa7qx40FOkW5b94J3").whereField("userId", isEqualTo: "gLcrV5nCzhREMdrgH57eDfRanr22").whereField("status", in: ["PendingForLabConfirmation" , "Done"]).order(by: "generatedCode").limit(to: 1).getDocuments() { (querySnapshot, err) in
        //        let docRef = db!.collection("TestsHassan").whereField("userId", isEqualTo: "gLcrV5nCzhREMdrgH57eDfRanr22").whereField("status", in: ["PendingForLabConfirmation" , "Done"]).getDocuments() { (querySnapshot, err) in
        ////        let docRef = db!.collection("TestsHassan").whereField("timeStampRequest", isGreaterThanOrEqualTo: 1589789967999).whereField("timeStampRequest", isLessThanOrEqualTo: 1589790079595).order(by: "timeStampRequest").getDocuments() { (querySnapshot, err) in
        //                if let err = err {
        //                    print("Error getting documents: \(err)")
        //                } else {
        //                    for document in querySnapshot!.documents {
        //                        print("\(document.documentID) => \(document.data())")
        //                        print(document.data())
        //
        //                    }
        //                    guard let lastSnapshot = querySnapshot!.documents.last else {
        //                        // The collection is empty.
        //                        return
        //                    }
        //                    let docRef2 = self.db!.collection("TestsHassan").document("IaTcOwrdXhVBa7qx40FOkW5b94J3").collection("IaTcOwrdXhVBa7qx40FOkW5b94J3").whereField("userId", isEqualTo: "gLcrV5nCzhREMdrgH57eDfRanr22").whereField("status", in: ["PendingForLabConfirmation" , "Done"]).order(by: "generatedCode", descending: true).limit(to: 1).start(afterDocument: lastSnapshot).getDocuments() { (querySnapshot, err) in
        //                    if let err = err {
        //                        print("Error getting documents: \(err)")
        //                    } else {
        //                        for document in querySnapshot!.documents {
        //                            print("\(document.documentID) => \(document.data())")
        //                            print(document.data())
        //
        //                        }
        //                    }
        //                }
        //        }
        //
        //        // Force the SDK to fetch the document from the cache. Could also specify
        //        // FirestoreSource.server or FirestoreSource.default.
        ////        docRef.getDocuments(source: <#T##FirestoreSource#>, completion: <#T##FIRQuerySnapshotBlock##FIRQuerySnapshotBlock##(QuerySnapshot?, Error?) -> Void#>)
        ////        docRef.getDocument { (document, error) in
        ////            if let document = document, document.exists {
        ////                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
        ////                print("Document data: \(dataDescription)")
        ////
        ////                let data = document.data()
        ////
        ////                let q1 = data!["q1"]! as? Bool ?? true
        ////
        ////                if q1 == false {
        ////                 //false code
        ////                } else {
        ////                //true code
        ////                }
        ////            } else {
        ////                print("Document does not exist")
        ////            }
        ////        }
        ////        docRef.getDocuments(source: .cache, completion: nil) { (document, error) in
        ////          if let document = document {
        ////            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
        ////            print("Cached document data: \(dataDescription)")
        ////          } else {
        ////            print("Document does not exist in cache")
        ////          }
        ////        }
        //
        //
        //
        //
        //
        //
        ////        ref.child("TestsHassan").observeSingleEvent(of: .value, with: { (snapshot) in
        ////            // Get user value
        ////            for data in snapshot.children {
        ////                let snap = data as! DataSnapshot
        ////
        ////                print(snap)
        ////                self.ref.child("TestsHassan").child(snap.key).observeSingleEvent(of: .value, with: { (snapshot) in
        ////                    for dataChild in snapshot.children {
        ////                        let snapChild = dataChild as! DataSnapshot
        ////                        let dataDic = snapChild.value as? NSDictionary
        ////                        let status = dataDic!["status"] as! String
        ////                        if (status == "PendingForLabConfirmation") {
        ////                            self.ref.child("Lab").child(snap.key).observeSingleEvent(of: .value, with: { (snapshotLab) in
        ////                                let labDic = snapshotLab.value as? NSDictionary
        ////                                var request = Request()
        ////                                request.id = dataDic!["id"] as! String
        ////                                request.dateRequest = dataDic!["dateRequest"] as! String
        ////                                request.status = dataDic!["status"] as! String
        ////                                request.labName = labDic!["name"] as! String
        ////                                request.labPhoto = dataDic!["image"] as! String
        ////                                requests.append(request)
        ////                            });
        ////                        }
        ////                        print(snapChild)
        //////                        .queryOrdered(byChild: "status").queryEqual(toValue: "PendingForLabConfirmation")
        ////                       print(snapChild)
        ////                        self.ref.child("TestsHassan").child(snap.key).child(snapChild.key).observeSingleEvent(of: .value, with: { (snapshot) in
        //////                            print(snapshot)
        ////                        });
        ////                    }
        ////                    self.getRequestsPresenterRef.onSuccess(requests: requests)
        ////                });
        ////            };
        ////            let value = snapshot.value as? NSDictionary
        ////            var code = value?["code"] as? Int ?? 0
        ////            code += 1
        //            // ...
        ////        }) { (error) in
        ////            print(error.localizedDescription)
        ////        }
        //    }
    }
}
}
