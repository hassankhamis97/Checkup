//
//  MessagingChatModel.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/28/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Firebase
class MessagingChatModel: IMessagingChatModel {

    
    
//    var chatPresenterRef : IChat!
    let db : Firestore?
    var groupId : String!
    static var instance: MessagingChatModel!
    private init() {
//        self.chatPresenterRef = chatPresenterRef
        db = Firestore.firestore()
    }
    // sigletone method
    static func getInstance() -> MessagingChatModel {
//        db = Firestore.firestore()
        if instance == nil {
            instance = MessagingChatModel()
            
        }
        return instance
    }
    func getData(chatPresenterRef : IChat,messageParams: MessageParams) {
        var isFirebaseCalled : Bool? = nil
        var dbRef : Query!
        if messageParams.pearedId! > Auth.auth().currentUser!.uid {
            groupId = messageParams.pearedId! + "-" + Auth.auth().currentUser!.uid
        }
        else {
            groupId = Auth.auth().currentUser!.uid + "-" + messageParams.pearedId!
        }
        if messageParams.skip == nil{
            dbRef = db?.collection("messages").document(groupId).collection(groupId).order(by: "timestamp", descending: true).limit(to: messageParams.take!)
//            isFirebaseCalled = true
        }
        else {
            dbRef = db?.collection("messages").document(groupId).collection(groupId).order(by: "timestamp", descending: true).limit(to: messageParams.take!).start(afterDocument: messageParams.skip!)
//            isFirebaseCalled = true
        }
        isFirebaseCalled = false
        dbRef.addSnapshotListener { QuerySnapshot, error in
            if let err = error {
                print("Error getting docments : \(err)")
            }else{
                print(QuerySnapshot)
                var allMessages = AllMessages()
                allMessages.messages = [Message]()
//                guard let lastSnapshot = QuerySnapshot!.documents.last else {
//                                    return
//                                }
                
                //                skip = lastSnapshot
                for item in QuerySnapshot!.documents {
                    //                        let messageData: Data = NSKeyedArchiver.archivedData(withRootObject: item.data())
                    //                        let messageObj = try JSONDecoder().decode(Message.self , from: messageData)
                    var messageObj = Message()
                    messageObj.content = item.data()["content"] as? String ?? ""
                    messageObj.idFrom = item.data()["idFrom"] as? String ?? ""
                    messageObj.idTo = item.data()["idTo"] as? String ?? ""
                    messageObj.timestamp = item.data()["timestamp"] as? String
                    messageObj.type = item.data()["type"] as? Int
                    
                    allMessages.messages!.append(messageObj)
                    
                }
//                guard let lastSnapshot = QuerySnapshot!.documents.last else {
//                                                    return
//                                                }
//                if(QuerySnapshot!.documents.count > 0 ){
//                    allMessages.lastMessageSnapshot =
//                }
                if let lastSnapshot = QuerySnapshot!.documents.last {
                    allMessages.lastMessageSnapshot = lastSnapshot
                }
//                 if let lastSnapshot = QuerySnapshot!.documents.last else {
//                                                    return
//                                                }
                if let messagingChatPresenterRef = chatPresenterRef as? IMessagingChatPresenter {
                    if isFirebaseCalled == nil || isFirebaseCalled == true{
                        messagingChatPresenterRef.onSuccess(allMessages: allMessages, isFirebaseCall: true)
                        isFirebaseCalled = true
                    }
                    else{
                        messagingChatPresenterRef.onSuccess(allMessages: allMessages, isFirebaseCall: false)
                        isFirebaseCalled = true
                    }
                }
//                self.newPresenter.onSuccess(pearedArr: self.pearedArr)
            }
        }
    }
    func saveMessage(chatPresenterRef : IChat,message : Message) {
        let messageDic = try! DictionaryEncoder.encode(message)
        let dbRef = db?.collection("messages").document(groupId).collection(groupId).document(message.timestamp!).setData(messageDic) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
        
        
    }
}
}
