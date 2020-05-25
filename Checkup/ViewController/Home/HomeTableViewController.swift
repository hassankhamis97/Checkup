//
//  HomeTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import ImageSlideshow
import Firebase
class HomeTableViewController: UITableViewController   {
    
    var searchCellHeight = 0.0
    
    var reach : Bool = false
    
    var labFilter : FilterLabTableView!
    var labNames = ["El-Mokhtabar" , "Alpha" , "El-Borg" , "El-Mokhtabar"]
    var labImages = ["mokhtabar" , "alpha" , "borg" ,"mokhtabar" ]
    var labDate = ["21/2/2005" , "1/11/2019" , "5/9/2008" , "8/6/2016"]
    
    var homeLabArr = [HomeLab]()
    
    var searchedHomeLabsArr = [HomeLab]()
    
    @IBOutlet weak var labCollection: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var labSlideShow: ImageSlideshow!
    
    @IBOutlet weak var searchTVCell: UITableViewCell!
    
    let pageIndicator = UIPageControl()
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return CGFloat(searchCellHeight)
        } else if indexPath.row == 1 {
            return 192
        }
        else if indexPath.row == 2 {
            return 479
        } else {
            return 0
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tabBarItem.badgeValue = "1"
        
        let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
        homeLabPresenter.getLabs(take: 1, skip: homeLabArr.count)
        
        let layout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
               layout.itemSize = CGSize(width: 200, height: 240)  //233
               layout.minimumInteritemSpacing = 0.05
               
               self.labCollection?.collectionViewLayout = layout
        //
        //        var labObj = Laboratory(id: "", name: "El Mokhtabar", formalReferencePathId: "", specialTests: "", image: "", branches: ["",""])
        //
        //        var ref: DatabaseReference!
        //
        //        ref = Database.database().reference()
        //        var id = ref.childByAutoId()
        //        labObj.id = id.key! as! String
        //        ref.child("Lab").child(labObj.id!).setValue(labObj.toDictionary())
        //
        //
        
        //        var reatTime = RealTime()
        //        reatTime.initGeneratedCode()
        ////        reatTime.addLab(name: "lab10", image:  "")
        //        var p1 = Phone(number: "03482584", isLand: true)
        //        var p2 = Phone(number: "0129300", isLand: false)
        //        var phoneArr = [Phone]()
        //        phoneArr.append(p1)
        //        //phoneArr.append(p2)
        //        var addressObj = Address(address: "Toreel,Mansoura", buildingNo: "2", floorNo: "", apartmentNo: "", longitude: "31.4913", latitude: "31.1656")
        //        var addressObj = Address()
        
        //        var addressObj = Address()
        /*
         reatTime.addUser(id: "gLcrV5nCzhREMdrgH57eDfRanr22",  email: "asd@asd.com", birthdate: "", gender: "", phone:phoneArr , insurance: "eng", address: addressObj, imagePath: "", name:"ahmed ali")
         
         */
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterTapped))
    }
    
    @IBAction func searchFilter(_ sender: Any) {
        
        if searchCellHeight == 70.0 {
            searchCellHeight = 0.0
        } else {
            searchCellHeight = 70.0
        }
        tableView.reloadData()
    }
    
    
    @objc func filterTapped(){
        if #available(iOS 13.0, *) {
            labFilter = storyboard?.instantiateViewController(identifier: "filterLab") as! FilterLabTableView
        } else {
            
        }
        navigationController?.pushViewController(labFilter, animated: true)
    }
}
