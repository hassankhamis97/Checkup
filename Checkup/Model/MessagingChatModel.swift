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
    var ref: DatabaseReference!
    var groupId : String!
    static var instance: MessagingChatModel!
    private init() {
        //        self.chatPresenterRef = chatPresenterRef
        db = Firestore.firestore()
        ref = Database.database().reference()
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
        if messageParams.pearedId! < Auth.auth().currentUser!.uid {
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
                if let sendMessagePresenter = chatPresenterRef as? ISendMessagePresenter {
                    sendMessagePresenter.onSuccess()
                }
                if let imageMessagePresenter = chatPresenterRef as? IImageMessagePresenter {
                    imageMessagePresenter.onSuccess()
                }
                
                
                print("Document successfully written!")
            }
            
            
        }
    }
    func saveMessage(chatPresenterRef: IChat, imageMessage: ImageMessage) {
        var imgPathsArr = [String]()
        var count = 0
        for i in 0..<imageMessage.images!.count{
            var id = ref.childByAutoId()
            let storageRef = Storage.storage().reference().child("chat/\(Auth.auth().currentUser!.uid)/image\(id.key!).jpg")
            // Create the file metadata
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            let uploadTask = storageRef.putData(imageMessage.images![i].pngData()!, metadata: metadata) { (metadata, error) in
                guard let metadata = metadata else {
                    // Uh-oh, an error occurred!
                    //                        self.newRequestPresenterRef.onFail(message: error!.localizedDescription)
                    return
                }
                // Metadata contains file metadata such as size, content-type.
                let size = metadata.size
                // You can also access to download URL after upload.
                storageRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        //                            self.newRequestPresenterRef.onFail(message: error!.localizedDescription)
                        // Uh-oh, an error occurred!
                        return
                    }
                    imgPathsArr.append(downloadURL.absoluteString)
                    print(url)
                    count += 1
                    if(count == imageMessage.images!.count){
                        //                    testObj.roushettaPaths = imgPathsArr
                        self.saveCompleteObj(imgPathsArr: imgPathsArr, idTo: imageMessage.idTo,chatPresenterRef: chatPresenterRef)
                        //                            self.newRequestPresenterRef.onSuccess()
                    }
                }
            }
        }
        
    }
    func saveCompleteObj(imgPathsArr: [String]?, idTo: String?,chatPresenterRef: IChat) {
        for item in imgPathsArr! {
            var message = Message(content: item, idFrom: Auth.auth().currentUser!.uid, idTo: idTo!, timestamp: String(Date().toMillis()!), type: 1)
            saveMessage(chatPresenterRef: chatPresenterRef, message: message)
            
        }
    }
}

