//
//  MainChatViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Firebase
class MainChatViewController: UIViewController , IMainChatView {
    
    var viewPearedArr : [PearedUserData] = [PearedUserData]()
    var pearedUsers : [PearedUserData] = [PearedUserData]()
    
    
    var presenter : IMainChatPresenenter!
    
    @IBOutlet var pearedTableView: UITableView!
    

    
    override func viewWillAppear(_ animated: Bool) {
        if(Auth.auth().currentUser?.uid == nil)
        {
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginSVC") as! LoginTableViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
            
        }
        else{
            presenter = MainChatPresenter(view: self)
            presenter.getDataFromModel()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pearedTableView.register(UINib(nibName: "MainChatTableViewCell", bundle: nil), forCellReuseIdentifier: "mainChatCell")
     
        
        /*var pearedUsersObj = PearedUserData(idPearedUser: "512184", name: "Elmokhtabar", imgUrl: "https://mobresults.almokhtabar.com:88/UploadedImages/aacd8efc-6096-4230-ab87-5140e90c5e45.jpg", lastMessage: "send your lab please", lastMessageTime: "1589217899264" , noOfUnReadMessages: "5")
        var pearedUsersObj1 = PearedUserData(idPearedUser: "512184", name: "Mahmoud", imgUrl: "https://img.youm7.com/ArticleImgs/2019/8/29/39460-BRG-Logo.jpg", lastMessage: "Thank you", lastMessageTime: "1589217899264",noOfUnReadMessages: "50")
        pearedUsers.append(pearedUsersObj)
        pearedUsers.append(pearedUsersObj1)
*/
        
    }
    
    
    func dataInView(peared: [PearedUserData]) {
        
        viewPearedArr = peared
        
        print("data in view\(viewPearedArr.count)")
       self.pearedTableView.reloadData()
        
       }
      

}
