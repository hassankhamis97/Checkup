//
//  MoreTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/14/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage
class MoreTableViewController: UITableViewController {

    
    @IBOutlet weak var profileImg: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var user=User()
    var profilePresenterRef:ProfilePresenter!
      
    override func viewWillAppear(_ animated: Bool) {
        
        if  UserAuthorization.check() == true {
          
            profilePresenterRef = ProfilePresenter(profileView: self)
                               let userId = Auth.auth().currentUser?.uid

                               profilePresenterRef.getUser(userId: userId!)

        }else{
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginSVC") as! LoginTableViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)

        }
        
//        if(Auth.auth().currentUser?.uid == nil)
//        {
//            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginSVC") as! LoginTableViewController
//            loginVC.modalPresentationStyle = .fullScreen
//            self.present(loginVC, animated: true, completion: nil)
//
//            
//        }
//        else{
//            
//            
//            profilePresenterRef = ProfilePresenter(profileView: self)
//                               let userId = Auth.auth().currentUser?.uid
//
//                               profilePresenterRef.getUser(userId: userId!)
//        }
    }
    
    
    func reloadData()
    {
     
        nameLabel.text=user.name
        
        profileImg.sd_setImage(with: URL(string: user.imagePath ?? "users"), placeholderImage: UIImage(named: "users"))
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.cornerRadius=profileImg.frame.width/2

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row==0{
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "profileSVCRef") as! ProfileTableViewController
            
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        if indexPath.row==1{
          //statistcsSVC
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "statistcsSVC") as! StatisticsTableViewController
                       
                       navigationController?.pushViewController(vc, animated: true)
            
            
            
            print("statistics")
        }
        
        if indexPath.row==2{
                         
                       let vc = storyboard?.instantiateViewController(withIdentifier: "precautionsSVC") as!PrecautionsTableViewController
                                 
                                 navigationController?.pushViewController(vc, animated: true)
                         
                     }
        
        
        if indexPath.row==3{
            
          let vc = storyboard?.instantiateViewController(withIdentifier: "healthSVC") as!HealthProfileTableViewController
                    
                    navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
        if indexPath.row==4{
            
          let vc = storyboard?.instantiateViewController(withIdentifier: "settingSVCRef") as! SettingTableViewController
                    
                    navigationController?.pushViewController(vc, animated: true)
            
        }
        
        if indexPath.row==7{
                   
                 let vc = storyboard?.instantiateViewController(withIdentifier: "termsSVC") as! TermsOfUseTableViewController

                           navigationController?.pushViewController(vc, animated: true)
                   print("terms")
               }
        
        
        if indexPath.row==8{
            do{
               try Auth.auth().signOut()
//
                
                
                
                let dViewController = self.storyboard?.instantiateViewController(withIdentifier: "homeSVC") as! HomeViewController
                let firstTabNavController = self.tabBarController?.viewControllers?[0] as! UINavigationController
                firstTabNavController.pushViewController(dViewController, animated: false)
                self.tabBarController?.selectedIndex = 0

            }
            catch{
                
            }
       print("logout")
            // precautionsSVC
        }
      
        
        
        
        
    }
 
  
         

}
