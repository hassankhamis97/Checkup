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
import CoreLocation

class HomeTableViewController: UITableViewController, CLLocationManagerDelegate   {
    
    var reach : Bool = false
    
    @IBOutlet weak var labsActicity: UIActivityIndicatorView!
    
    var labFilter : FilterLabTableView!
    var labNames = ["El-Mokhtabar" , "Alpha" , "El-Borg" , "El-Mokhtabar"]
    var labImages = ["mokhtabar" , "alpha" , "borg" ,"mokhtabar" ]
    var labDate = ["21/2/2005" , "1/11/2019" , "5/9/2008" , "8/6/2016"]
    
    var homeLabArr = [HomeLab]()
    
    var searchedHomeLabsArr = [HomeLab]()
    
    @IBOutlet weak var labCollection: UICollectionView!
    
    @IBOutlet weak var labSlideShow: ImageSlideshow!
    
    let pageIndicator = UIPageControl()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           if let location = locations.first {
               print("Found user's location: \(location)")
           }
       }

       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print("Failed to find user's location: \(error.localizedDescription)")
       }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            self.tableView.isScrollEnabled = true
        } else {
            
            //Setup Search Controller
            
            self.searchController.obscuresBackgroundDuringPresentation = false
            self.searchController.searchBar.placeholder = "Search".localized
            self.searchController.searchBar.barStyle = .black
            self.searchController.searchBar.delegate = self
            self.definesPresentationContext = true
            self.navigationItem.searchController = searchController
//            let leftConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .leading, relatedBy: .equal, toItem: navigationController?.navigationBar, attribute: .leading, multiplier: 1, constant: 20) // add margin
//
//            let bottomConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .bottom, relatedBy: .equal, toItem: navigationController?.navigationBar, attribute: .bottom, multiplier: 1, constant: 1)
//
//            let topConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .top, relatedBy: .equal, toItem: navigationController?.navigationBar, attribute: .top, multiplier: 1, constant: 1)
//
//            let widthConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.size.width - 40)
            self.tableView.isScrollEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tabBarItem.badgeValue = "1"
        labSlideShow.layer.cornerRadius = 10
        let manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            manager.startUpdatingLocation()
        }
        
        labsActicity.transform = CGAffineTransform.init(scaleX: 2, y: 2)
        
        showIndicator()
        let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
        homeLabPresenter.getLabs(take: 4, skip: homeLabArr.count)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: 180, height: 240)  //233
        layout.minimumInteritemSpacing = 0.05
        
        self.labCollection?.collectionViewLayout = layout
        
        // search bar in navigation controller
        
        //Setup Search Controller
        
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search".localized
        self.searchController.searchBar.barStyle = .black
        self.searchController.searchBar.delegate = self
        self.definesPresentationContext = true
        self.navigationItem.searchController = searchController
        //        self.definesPresentationContext = true
        //        searchController.dismiss(animated: false, completion: nil)
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
        let leftConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .leading, relatedBy: .equal, toItem: navigationController?.navigationBar, attribute: .leading, multiplier: 1, constant: 20) // add margin

        let bottomConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .bottom, relatedBy: .equal, toItem: navigationController?.navigationBar, attribute: .bottom, multiplier: 1, constant: 1)

        let topConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .top, relatedBy: .equal, toItem: navigationController?.navigationBar, attribute: .top, multiplier: 1, constant: 1)

        let widthConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.size.width - 40) // - margins from both sides
    }
    
    @objc func filterTapped(){
        if #available(iOS 13.0, *) {
            labFilter = storyboard?.instantiateViewController(identifier: "filterLab") as! FilterLabTableView
        } else {
            
        }
        navigationController?.pushViewController(labFilter, animated: true)
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    //       let width = ((collectionView.frame.width - 20) / 2) // 15 because of paddings
//    //       print("cell width : \(width)")
//    //       return CGSize(width: width, height: 200)
//        let height = labCollection.frame.size.height
//        let width = labCollection.frame.size.width
//
//        if(height > width)
//        {
//        // in case you you want the cell to be 40% of your controllers view
//    //        return CGSize(width: width * 0.5, height: 266)
//            let cellHeight = (width * 0.5 * 285)/(375 * 0.5)
//            return CGSize(width: width * 0.5, height: cellHeight)
//        }
//        else{
//            let cellHeight = (width * 0.25 * 250)/(667 * 0.25)
//            return CGSize(width: width * 0.25, height: cellHeight)
//        }
//       }
}
