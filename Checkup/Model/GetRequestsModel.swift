//
//  GetRequests.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation

import Firebase
class GetRequestsModel: IGetRequestsModel {
    
    var ref: DatabaseReference!
    var getRequestsPresenterRef : IGetRequestsPresenter
    init(getRequestsPresenterRef : IGetRequestsPresenter) {
        self.getRequestsPresenterRef = getRequestsPresenterRef
        ref = Database.database().reference()
    }
    func getRequests() {
//        .orderByChild("status").startAt("PendingForLabConfirmation").endAt("Done")
        var requests = [Request]()
        ref.child("TestsHassan").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            for data in snapshot.children {
                let snap = data as! DataSnapshot
                
                print(snap)
                self.ref.child("TestsHassan").child(snap.key).observeSingleEvent(of: .value, with: { (snapshot) in
                    for dataChild in snapshot.children {
                        let snapChild = dataChild as! DataSnapshot
                        let dataDic = snapChild.value as? NSDictionary
                        let status = dataDic!["status"] as! String
                        if (status == "PendingForLabConfirmation") {
                            self.ref.child("Lab").child(snap.key).observeSingleEvent(of: .value, with: { (snapshotLab) in
                                let labDic = snapshotLab.value as? NSDictionary
                                var request = Request()
                                request.id = dataDic!["id"] as! String
                                request.dateRequest = dataDic!["dateRequest"] as! String
                                request.status = dataDic!["status"] as! String
                                request.labName = labDic!["name"] as! String
                                request.labPhoto = dataDic!["image"] as! String
                                requests.append(request)
                            });
                        }
                        print(snapChild)
                        
//                        self.ref.child("TestsHassan").child(snap.key).child(snapChild.key).queryOrdered(byChild: "status").queryEqual(toValue: "PendingForLabConfirmation").observeSingleEvent(of: .value, with: { (snapshot) in
//                            print(snapshot)
//                        });
                    }
                    self.getRequestsPresenterRef.onSuccess(requests: requests)
                });
            };
//            let value = snapshot.value as? NSDictionary
//            var code = value?["code"] as? Int ?? 0
//            code += 1
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
