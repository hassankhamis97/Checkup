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
    var pearedObj : PearedUserData = PearedUserData()
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
                    self.queryArr = QuerySnapshot?.documents.count
                    print(doc.documentID)
                        print(doc.data())
                    print(doc.data()["lastMessage"]!)
                    self.pearedObj.lastMessage = doc.data()["lastMessage"] as? String
                    self.pearedObj.noOfUnReadMessages = String(doc.data()["noOfUnReadMessage"] as! Int)
                    self.pearedObj.lastMessageTime = doc.data()["lastMsgTimeStamp"] as? String
                    
                    self.pearedObj.idPearedUser = doc.data()["senderId"] as? String
                    if ( self.pearedObj.idPearedUser == Auth.auth().currentUser!.uid)
                    {
                        self.pearedObj.idPearedUser = doc.documentID
                    }
                    self.readRestOfDataFromFirestore(id: self.pearedObj.idPearedUser as! String , count: self.queryArr)

                    
                    
                    //self.pearedArr.append(self.pearedObj)
                    
                }
               //self.newPresenter.onSuccess(pearedArr: self.pearedArr)
            }

    })
        
    }
    
    func readRestOfDataFromFirestore(id : String , count : Int){
    
        db.collection("users").document(id).getDocument {(document  ,error) in
           
            print(document!)
            print(document?.data()?["nickname"] as? String?)
            
            self.pearedObj.name = (document?.data()?["nickname"] as? String?)!
            self.pearedObj.imgUrl = (document?.data()?["photoUrl"] as? String?)!
            print(self.pearedObj.imgUrl!)
            print(self.pearedObj.name!)
            print("document \(document!)")
            self.counter = self.counter+1
            
            self.pearedArr.append(self.pearedObj)
            if (self.counter == count ){
                self.newPresenter.onSuccess(pearedArr: self.pearedArr)
                print("counter :  \(self.counter)")

            }
        }
        

    }
    
}
