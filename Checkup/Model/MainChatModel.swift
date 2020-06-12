//
//  MainChatModel.swift
//  Checkup
//
//  Created by Aya on 5/19/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
class MainChatModel : IMainChatModel{
    let db = Firestore.firestore()
    var pearedArr : [PearedUserData] = [PearedUserData]()
//    var pearedObj : PearedUserData = PearedUserData()
    var newPresenter : IMainChatPresenenter!
    var counter  = 0
    var queryArr : Int!
    init(presenter : IMainChatPresenenter) {
        newPresenter = presenter
    }
   
    
    func readDataFromFirestore(){
  db.collection("userChat").document(Auth.auth().currentUser!.uid).collection(Auth.auth().currentUser!.uid).getDocuments(completion: {
            QuerySnapshot , Error in
            if let err = Error {
                print("Error getting docments : \(err)")
            }else{
                for doc in QuerySnapshot!.documents{
                    var pearedObj : PearedUserData = PearedUserData()
                    self.queryArr = QuerySnapshot?.documents.count
                    print(doc.documentID)
                        print(doc.data())
                    print(doc.data()["lastMessage"]!)
                    pearedObj.lastMessage = doc.data()["lastMessage"] as? String
                    pearedObj.noOfUnReadMessages = String(doc.data()["noOfUnReadMessage"] as! Int)
                    pearedObj.lastMessageTime = doc.data()["lastMsgTimeStamp"] as? String
                    
                    pearedObj.idPearedUser = doc.data()["senderId"] as? String
                    if (pearedObj.idPearedUser == Auth.auth().currentUser!.uid)
                    {
                        pearedObj.idPearedUser = doc.documentID
                    }
                     self.pearedArr.append(pearedObj)
                    self.readRestOfDataFromFirestore(pearedObj: pearedObj  , count: self.queryArr)

                    
                    
                    //self.pearedArr.append(self.pearedObj)
                    
                }
               //self.newPresenter.onSuccess(pearedArr: self.pearedArr)
            }

    })
        
    }
    
    func readRestOfDataFromFirestore(pearedObj : PearedUserData , count : Int){
    
        db.collection("users").document(pearedObj.idPearedUser as! String).getDocument {(document  ,error) in
           
            print(document!)
            print(document?.data()?["nickname"] as? String?)
            
            pearedObj.name = (document?.data()?["nickname"] as? String?)!
            pearedObj.imgUrl = (document?.data()?["photoUrl"] as? String?)!
//            print(pearedObj.imgUrl!)
//            print(pearedObj.name!)
            print("document \(document!)")
            self.counter = self.counter+1
            
           
            if (self.counter == count ){
                self.newPresenter.onSuccess(pearedArr: self.pearedArr)
                print("counter :  \(self.counter)")

            }
        }
        

    }
    
}
