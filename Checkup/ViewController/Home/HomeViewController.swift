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
        
        let url="https://firebasestorage.googleapis.com/v0/b/checkup-23ffe.appspot.com/o/Labs%2FWhatsApp%20Image%202020-06-13%20at%201.45.32%20AM.jpeg?alt=media&token=3bd9869f-674f-4df7-9451-814a035e9158"
        
        
        
       // sror: https://firebasestorage.googleapis.com/v0/b/checkup-23ffe.appspot.com/o/Labs%2FWhatsApp%20Image%202020-06-06%20at%204.55.14%20PM%20(2).jpeg?alt=media&token=991de809-36cd-4071-a937-6e090c836b3e
        
        //kaws:https://firebasestorage.googleapis.com/v0/b/checkup-23ffe.appspot.com/o/Labs%2FWhatsApp%20Image%202020-06-06%20at%204.55.14%20PM.jpeg?alt=media&token=8c8f9192-2435-4c5d-9745-efababd288c8
        
        
        // manar :https://firebasestorage.googleapis.com/v0/b/checkup-23ffe.appspot.com/o/Labs%2FWhatsApp%20Image%202020-06-13%20at%201.45.32%20AM.jpeg?alt=media&token=3bd9869f-674f-4df7-9451-814a035e9158

        
        
        var realTime=RealTime()
//
//       realTime.addLab(name: "Zewil Lab", image: url, email: "zewil@gmail.com", hotLine: "988110", rating: 5)
        
////       var address=Address(address1: "Tahta Road -Sohag", buildingNo: "18", floorNo: "4", apartmentNo: "3", longitude:31.1768104
////        , latitude: 26.8844932 )
////
////
//        realTime.addBranch(name: "Zewil(Tahta Road)", email: "zewil_tahta_road@gmail.com", labId:24, image: url, phone: "    093369010", isFromHome: true, timeFrom: "10:00 AM", timeTo: "10:00 PM", holidays: "Friday", address: address, rating: 2.5, governId: 9)
//
        
     /*
      
       var address2=Address(address1: "Samia el gamal street,Mansoura", buildingNo: "9", floorNo: "4", apartmentNo: "7", longitude: 31.367131, latitude:   31.031015)
        
   
           realTime.addBranch(name: "Al-kaws(Samia el gamal)", email: "Al-kaws_Samia_el_gamal@gmail.com", labId:20, image: url, phone: "0502354290", isFromHome: true, timeFrom: "10:00 AM", timeTo: "10:00 PM", holidays: "Friday", address: address2, rating: 3, governId: 7)
        
        */
        
       
//        var address3=Address(address1: "Alshahid atef elsadat Street", buildingNo: "10", floorNo: "4", apartmentNo: "3", longitude:32.2997523
//                      , latitude:31.2710749)
//
//            realTime.addBranch(name: "Al-Manar(Alshahid atef elsadat)", email: "al_manar_alshahid_atef_elsadat@gmail.com", labId:25, image: url, phone: "066245687-066234576", isFromHome: true, timeFrom: "10:00 AM", timeTo: "10:00 PM", holidays: "Friday", address: address3, rating: 2.5, governId: 4)
//        
        
        /*
        var address3=Address(address1: "AlGish Street", buildingNo: "6", floorNo: "2", apartmentNo: "1", longitude:31.2426718
                             , latitude: 30.7148723)

          
           
        realTime.addBranch(name: "Al-Manar(AlGish Street)", email: "al_manar_algish_street@gmail.com", labId:25, image: url, phone: "0402567985-0402567987", isFromHome: true, timeFrom: "10:00 AM", timeTo: "10:00 PM", holidays: "Friday", address: address3, rating: 3.5, governId: 10)
        
        */

        
        
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
