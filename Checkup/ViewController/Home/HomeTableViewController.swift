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
    
    var reach : Bool = false
    
    var labFilter : FilterLabTableView!
    var labNames = ["El-Mokhtabar" , "Alpha" , "El-Borg" , "El-Mokhtabar"]
    var labImages = ["mokhtabar" , "alpha" , "borg" ,"mokhtabar" ]
    var labDate = ["21/2/2005" , "1/11/2019" , "5/9/2008" , "8/6/2016"]
    
    var homeLabArr = [HomeLab]()
    
    var searchedHomeLabsArr = [HomeLab]()
    
    @IBOutlet weak var labCollection: UICollectionView!
    
    @IBOutlet weak var labSlideShow: ImageSlideshow!
    
    let pageIndicator = UIPageControl()
    
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
           super.viewWillTransition(to: size, with: coordinator)
           if UIDevice.current.orientation.isLandscape {
                self.tableView.isScrollEnabled = true
           } else {
               self.tableView.isScrollEnabled = false
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tabBarItem.badgeValue = "1"
        
        let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
        homeLabPresenter.getLabs(take: 8, skip: homeLabArr.count)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: 200, height: 240)  //233
        layout.minimumInteritemSpacing = 0.05
        
        self.labCollection?.collectionViewLayout = layout
        
        // search bar in navigation controller
        
        //Setup Search Controller
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        self.searchController.searchBar.barStyle = .black
        self.searchController.searchBar.delegate = self
        self.definesPresentationContext = true
        self.navigationItem.searchController = searchController
        
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
    
    @objc func filterTapped(){
        if #available(iOS 13.0, *) {
            labFilter = storyboard?.instantiateViewController(identifier: "filterLab") as! FilterLabTableView
        } else {
            
        }
        navigationController?.pushViewController(labFilter, animated: true)
        
    }
}



//MARK: SEARCH BAR DELEGATE
/*extension HomeTableViewController: UISearchBarDelegate
 {
 //    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
 //    {
 //        //Show Cancel
 //        searchBar.setShowsCancelButton(true, animated: true)
 //        searchBar.tintColor = .white
 //    }
 
 //    private func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
 //    {
 //        //Filter function
 ////        self.filterFunction(searchText: searchText)
 //    }
 
 func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
 {
 //Hide Cancel
 searchBar.setShowsCancelButton(false, animated: true)
 searchBar.resignFirstResponder()
 
 //        guard let term = searchBar.text , term.trim().isEmpty == false else {
 //
 //            //Notification "White spaces are not permitted"
 //            return
 //        }
 
 //Filter function
 //        self.filterFunction(searchText: term)
 }
 
 func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
 {
 //Hide Cancel
 searchBar.setShowsCancelButton(false, animated: true)
 searchBar.text = String()
 searchBar.resignFirstResponder()
 
 //Filter function
 //        self.filterFunction(searchText: searchBar.text)
 }
 }*/
