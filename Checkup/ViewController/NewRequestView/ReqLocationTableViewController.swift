//
//  ReqLocationTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import MapKit
class ReqLocationTableViewController: UITableViewController , ICheckLocation {
    
    @IBOutlet var addressTxt: SkyFloatingLabelTextField!
    @IBOutlet var buildingNoTxt: SkyFloatingLabelTextField!
    
    @IBOutlet var floorNoTxt: SkyFloatingLabelTextField!
    @IBOutlet var ApartmentNoTxt: SkyFloatingLabelTextField!
    @IBOutlet var mapView: MKMapView!
    var locationManager:CLLocationManager!
    var currentLocationStr = "Current location"
    var addressObj = Address()
    var isAuto : Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = (
            storyboard?.instantiateViewController(
                withIdentifier: "ReqLocPopUpSVC"))! as! ReqPopUpLocationViewController
        vc.reqLocationRef = self
        present(vc, animated: true, completion: nil)
    }
    
    func checkLocationMethod(isAuto: Bool) {
//        self.isAuto = isAuto
        if isAuto {
            determineCurrentLocation()
        }
    }
    
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
    
    func setUsersClosestLocation(mLattitude: CLLocationDegrees, mLongitude: CLLocationDegrees) -> String {
        addressObj.longitude = mLongitude
        addressObj.latitude = mLattitude
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: mLattitude, longitude: mLongitude)
        geoCoder.reverseGeocodeLocation(location) {
            (placemarks, error) -> Void in
            
            if let mPlacemark = placemarks{
                if let dict = mPlacemark[0].addressDictionary as? [String: Any]{
                    if let Name = dict["Name"] as? String{
                        if let City = dict["City"] as? String{
                            self.currentLocationStr = Name + ", " + City
                        }
                    }
                }
            }
        }
        return currentLocationStr
    }
}


