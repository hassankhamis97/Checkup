//
//  HomeViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/31/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import ImageSlideshow
import Firebase
import CoreLocation
class HomeViewController: UIViewController ,UICollectionViewDelegateFlowLayout ,UITextFieldDelegate,UISearchBarDelegate {
    //    @IBOutlet var labCollectionCell: UITableViewCell!
    @IBOutlet var topViewConstraint: NSLayoutConstraint!
    @IBOutlet var headerViewHeight: NSLayoutConstraint!
    var reach : Bool = false
    //    var cellWidth : CGSize!
    let imageViewMaxHeight : CGFloat = 276
    let imageViewMinHeight : CGFloat = 0
    let topViewConstrainsMaxHeight : CGFloat = 5
    let topViewConstrainsMinHeight : CGFloat = -271
    var locationManager:CLLocationManager!
    //    @IBOutlet var sliderShowCell: UITableViewCell!
//    @IBOutlet var noDataLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var labsActicity: UIActivityIndicatorView!
    //    @IBOutlet var headerViewHeight: NSLayoutConstraint!
    //       let imageViewMaxHeight : CGFloat = 192
    //         let imageViewMinHeight : CGFloat = 0
    
    var homeLabArr = [HomeLab]()
    
    var searchedHomeLabsArr = [HomeLab]()
    var isLoading = false
    var tap: UITapGestureRecognizer!
    @IBOutlet weak var labCollection: UICollectionView!
    
    @IBOutlet weak var labSlideShow: ImageSlideshow!
    
    let pageIndicator = UIPageControl()
    
    let searchController = UISearchController(searchResultsController: nil)
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            print("Found user's location: \(location)")
//        }
//    }
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Failed to find user's location: \(error.localizedDescription)")
//    }
//
    func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    func setUsersClosestLocation(mLattitude: CLLocationDegrees, mLongitude: CLLocationDegrees) {
            print(mLattitude )
        print(mLongitude )
        
            let defaultsLocation = UserDefaults.standard
            defaultsLocation.set(mLattitude.magnitude, forKey: "Lattitude")
            defaultsLocation.set(mLongitude.magnitude, forKey: "Longitude")
//        let lattitude = defaultsLocation.object(forKey: "Lattitude") as? Double ?? 0
//        let longitude = defaultsLocation.object(forKey: "Longitude") as? Double ?? 0
//        print(longitude)
//            mkAnnotation.coordinate = CLLocationCoordinate2DMake(mLattitude, mLongitude)
            
//            addressObj.longitude = mLongitude
//            addressObj.latitude = mLattitude
            
            
//            getNameByGeoCoder(latitude: mLattitude, longitude: mLongitude)
//
//
//            mapView.addAnnotation(mkAnnotation)

    //        return currentLocationStr
        }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    override func viewWillAppear(_ animated: Bool) {
        //                   self.headerViewHeight.constant = self.imageViewMaxHeight
        
        self.headerViewHeight.constant = self.imageViewMaxHeight
        self.topViewConstraint.constant =  topViewConstrainsMaxHeight
        determineCurrentLocation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tabBarItem.badgeValue = "1"
        labSlideShow.layer.cornerRadius = 10
        let manager = CLLocationManager()
        
        
        labsActicity.transform = CGAffineTransform.init(scaleX: 2, y: 2)
        
        showIndicator()
        let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
        homeLabPresenter.getLabs(take: 6, skip: homeLabArr.count)
        
        
        tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

//        view.addGestureRecognizer(tap)
        //        let layout = UICollectionViewFlowLayout()
        //        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        //        layout.itemSize = CGSize(width: 180, height: 240)  //233
        //        layout.minimumInteritemSpacing = 0.05
        //
        //        self.labCollection?.collectionViewLayout = layout
        
        // search bar in navigation controller
        
        //Setup Search Controller
        
        //        self.searchController.obscuresBackgroundDuringPresentation = false
        //        self.searchController.searchBar.placeholder = "Search".localized
        //        self.searchController.searchBar.barStyle = .black
        //        self.searchController.searchBar.delegate = self
        //        self.definesPresentationContext = true
        //        self.navigationItem.searchController = searchController
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
        //        let leftConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .leading, relatedBy: .equal, toItem: navigationController?.navigationBar, attribute: .leading, multiplier: 1, constant: 20) // add margin
        //
        //        let bottomConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .bottom, relatedBy: .equal, toItem: navigationController?.navigationBar, attribute: .bottom, multiplier: 1, constant: 1)
        //
        //        let topConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .top, relatedBy: .equal, toItem: navigationController?.navigationBar, attribute: .top, multiplier: 1, constant: 1)
        //
        //        let widthConstraint = NSLayoutConstraint(item: self.searchController.searchBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: self.view.frame.size.width - 40) // - margins from both sides
    }
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {     searchBar.resignFirstResponder() }
    // function to enable dimiss key board(touch any where )
    @objc func dismissKeyboard() {
        view.removeGestureRecognizer(tap)
        view.endEditing(true)
    }
    //    @objc func filterTapped(){
    //        if #available(iOS 13.0, *) {
    //            labFilter = storyboard?.instantiateViewController(identifier: "filterLab") as! FilterLabTableView
    //        } else {
    //
    //        }
    //        navigationController?.pushViewController(labFilter, animated: true)
    //
    //    }
    //        override func viewDidLayoutSubviews() {
    //            super.viewDidLayoutSubviews()
    //            labCollection.collectionViewLayout.invalidateLayout()
    //        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = labCollection.frame.size.height
        let width = labCollection.frame.size.width
        if searchedHomeLabsArr.count <= 0 &&  searchBar.text?.count ?? 0 > 0 {
            if isLoading == false{
            return CGSize(width: width, height: height)
            }
            else {
                return CGSize(width: 0, height: 0)
            }
        }
            
            //
            //
        else if view.frame.size.width > view.frame.size.height {
            return CGSize(width: width * 0.25, height: 240)
        }
        else {
            return CGSize(width: (width * 0.5 - 5), height: 240)
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        labCollection.reloadData()
    }
}
