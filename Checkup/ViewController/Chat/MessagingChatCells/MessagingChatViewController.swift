//
//  MessagingChatViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class MessagingChatViewController: UIViewController {
//    @IBOutlet var msgTextField: UITextField!

    @IBOutlet var msgTextField: UITextView!
    @IBOutlet var msgTableView: UITableView!
    var isTop = false
    var allMessagesList : [String] = []
    var allMessagesListReversed : [String] = []
    var currentPearedUser : PearedUserData!
    var messageParams = MessageParams()
    var messages : [Message]!
    var messagingChatPresenter : MessagingChatPresenter!
    var imageMessagePresenter: ImageMessagePresenter!
    var imagePicker: ImagePicker!
    var isSendImage = false
    var databaseImageArray=[UIImage]()
    var hasNoOfNotification : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentPearedUser.name
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        msgTextField.layer.cornerRadius = 15.0
        msgTextField.layer.borderWidth = 2.0
//        msgTextField.layer.borderColor = UIColor.red.cgColor
//        msgTextField.layer.borderColor = UIColor.
        msgTextField.layer.borderColor = UIColor(red: 235, green: 235, blue: 235, alpha: 1.0).cgColor
        msgTableView.register(UINib(nibName: "SenderCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        msgTableView.register(UINib(nibName: "RecieverCellTableViewCell", bundle: nil), forCellReuseIdentifier: "recieverCell")
        msgTableView.register(UINib(nibName: "SenderImageTableViewCell", bundle: nil), forCellReuseIdentifier: "senderImageCell")
        msgTableView.register(UINib(nibName: "RecievedImageTableViewCell", bundle: nil), forCellReuseIdentifier: "recieverImageCell")
        msgTableView.register(UINib(nibName: "DateTableViewCell", bundle: nil), forCellReuseIdentifier: "dateCell")
        msgTableView.register(UINib(nibName: "ImageIndicatorTableViewCell", bundle: nil), forCellReuseIdentifier: "imageLoadingCell")
        // for reversed of tableview
        msgTableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        allMessagesList.append("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1402&q=80")
        allMessagesList.append("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg")
        allMessagesListReversed = allMessagesList.reversed()
        // Do any additional setup after loading the view.
        
        messagingChatPresenter = MessagingChatPresenter(messagingChatViewRef: self)
        messageParams.pearedId = currentPearedUser.idPearedUser
                
        
                messageParams.take = 20
        //        messagingChatPresenter.getData(messageParams: messageParams, skip: &(messageParams.skip)!)
        if ((currentPearedUser.noOfUnReadMessages! as NSString).integerValue > 0){
            hasNoOfNotification = true
        }
        messagingChatPresenter.getData(messageParams: messageParams,hasNoOfNotification: hasNoOfNotification)
        hasNoOfNotification = false
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func uploadImageBtn(_ sender: Any) {
        openPicker(sender : sender)
    }
}
import OpalImagePicker
extension MessagingChatViewController : OpalImagePickerControllerDelegate{
    func openPicker(sender : Any) {
        
    
    let alert = UIAlertController(title: "Photo", message: "Please Select an Option", preferredStyle: .actionSheet)
    
    alert.addAction(UIAlertAction(title: "Take Photo", style: .default , handler:{ (UIAlertAction)in
        print("User click Approve button")
        
        self.imagePicker.present(from: sender as! UIView)
        
    }))
    
    alert.addAction(UIAlertAction(title: "Choose Multiple Images ", style: .default , handler:{ (UIAlertAction)in
        let imagePicker = OpalImagePickerController()
        imagePicker.imagePickerDelegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }))
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
        print("User click Dismiss button")
    }))
    
    self.present(alert, animated: true, completion: {
        print("completion block")
    })
}
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]){
        for img in images{
            
            databaseImageArray.append(img) // to save to database
            
//            var x=ImageSource(image: img)
//            inputImageArray.append(x) // to save in slidshow
//            ind=0
//             deleteImageBtn.alpha=1
            
        }
        var imageMessage = ImageMessage(idTo: messageParams.pearedId!, images: databaseImageArray)
        imageMessagePresenter = ImageMessagePresenter(messagingChatViewRef: self)
        imageMessagePresenter.saveMessage(imageMessage: imageMessage)
        isSendImage = true
        msgTableView.reloadData()
//        slideShow.setImageInputs(inputImageArray)
        databaseImageArray.removeAll()
        
        presentedViewController?.dismiss(animated: true, completion: nil)
        
    }
}
extension MessagingChatViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        
        databaseImageArray.append(image!)
        var imageMessage = ImageMessage(idTo: messageParams.pearedId!, images: databaseImageArray)
        imageMessagePresenter = ImageMessagePresenter(messagingChatViewRef: self)
        imageMessagePresenter.saveMessage(imageMessage: imageMessage)
        databaseImageArray.removeAll()
        isSendImage = true
        msgTableView.reloadData()
//
//        var x=ImageSource(image:image!)
//        inputImageArray.append(x)
//        slideShow.setImageInputs(inputImageArray)
//         deleteImageBtn.alpha=1
        
    }
}
