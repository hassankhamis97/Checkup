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
class ReqLocationTableViewController: UITableViewController , ICheckLocation , UIGestureRecognizerDelegate, IView{
    
    var parentRef : IGetAddress?
    var isEditable : Bool?
    var mkAnnotation: MKPointAnnotation!
//    var gestureRecognizer : UITapGestureRecognizer?
    @IBOutlet var gestureOutlet: UITapGestureRecognizer!

    
    
    @IBAction func saveLocationBtn(_ sender: Any) {
        
        if(checkValidation()){
        addressObj.address1 = addressTxt.text
        addressObj.apartmentNo = ApartmentNoTxt.text
        addressObj.buildingNo = buildingNoTxt.text
        addressObj.floorNo = floorNoTxt.text
        
        parentRef?.getAddress(addressObj: addressObj)
        self.navigationController?.popViewController(animated: true)
    }
    
    }
    
    
    
    @IBOutlet var addressTxt: SkyFloatingLabelTextField!
    @IBOutlet var buildingNoTxt: SkyFloatingLabelTextField!
    
    @IBOutlet var floorNoTxt: SkyFloatingLabelTextField!
    @IBOutlet var ApartmentNoTxt: SkyFloatingLabelTextField!
    @IBOutlet var mapView: MKMapView!
    var locationManager:CLLocationManager!
    var currentLocationStr = "Current location"
    var addressObj : Address!
    var isAuto : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mkAnnotation = MKPointAnnotation()
        if isEditable! {
            let vc = (
                storyboard?.instantiateViewController(
                    withIdentifier: "ReqLocPopUpSVC"))! as! ReqPopUpLocationViewController
            vc.reqLocationRef = self
            present(vc, animated: true, completion: nil)
        }
        else{
            addressTxt.isEnabled=false
            buildingNoTxt.isEnabled=false
            floorNoTxt.isEnabled=false
            ApartmentNoTxt.isEnabled=false
        }
        if addressObj == nil {
            addressObj = Address()
        }
        else{
            addressTxt.text = addressObj.address1!
//            addressTxt?.text = "fdsfds"
            ApartmentNoTxt.text = addressObj.apartmentNo!
            buildingNoTxt.text = addressObj.buildingNo!
            floorNoTxt.text = addressObj.floorNo!
            setUsersClosestLocation(mLattitude: addressObj.latitude!, mLongitude: addressObj.longitude!)
            currentLocationStr = addressObj.address1!
        }
        
    }
    func checkValidation() -> Bool {
            var message: String = ""
            if(addressTxt.text!.isEmpty){
                message = "address is required"
            }
            else if ApartmentNoTxt.text!.isEmpty{
                message = "Apartment number is required"
            }
            else if floorNoTxt.text!.isEmpty{
                message = "floor number is required"
            }
        else if buildingNoTxt.text!.isEmpty{
            message = "building number is required"
        }
            else if addressObj.latitude == 0 && addressObj.longitude == 0{
            message = "please drop pin on map"
        }
            if !message.isEmpty {
                Alert.showSimpleAlert(title: "sorry",message: message, viewRef: self)
                return false
            }
            return true
        }
    func checkLocationMethod(isAuto: Bool) {
        self.isAuto = isAuto
        if isAuto {
            determineCurrentLocation()
        }
        
    }
//    func handleTap(gestureRecognizer: UILongPressGestureRecognizer) {
//
//        let location = gestureRecognizer.location(in: mapView)
//        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
//
//        // Add annotation:
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = coordinate
//        mapView.addAnnotation(annotation)
//    }
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
        
        mkAnnotation.coordinate = CLLocationCoordinate2DMake(mLattitude, mLongitude)
        
        addressObj.longitude = mLongitude
        addressObj.latitude = mLattitude
        
        
        getNameByGeoCoder(latitude: mLattitude, longitude: mLongitude)

        
        mapView.addAnnotation(mkAnnotation)

//        return currentLocationStr
    }
    override func tableView(_ tableView: UITableView,
                               heightForRowAt indexPath: IndexPath) -> CGFloat {
           
           if(isEditable==false)
           {
               
               if (indexPath.row==0||indexPath.row==1||indexPath.row==2)
               {
                   return 80
               }
               
               if(indexPath.row==3){
                   
                   return 0
                   
               }
            if(indexPath.row==5){
                             
                             return 40
                             
                         }
               
               if(indexPath.row==4){
                   
                   return 350
                   
               }
           }
               
               
               
           else{
               
               if(indexPath.row==0){
                   
                   return 80
                   
               }
               
               
               if (indexPath.row==1||indexPath.row==2||indexPath.row==3)
               {
                   return 70
               }
               
               
               if(indexPath.row==4){
                   
                   return 300
                   
               }
               
               if(indexPath.row==5){
                   
                   return 40
                   
               }
               
               
           }
           
           return tableView.rowHeight
           
       }
    @IBAction func addAnnotaionTabGestureRecognizer(_ sender: Any) {
        if isEditable! && !isAuto! {
        let location = gestureOutlet.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)

        // Add annotation:
        mkAnnotation.coordinate = coordinate
        addressObj.latitude = coordinate.latitude
        addressObj.longitude = coordinate.longitude
        getNameByGeoCoder(latitude: addressObj.latitude!, longitude: addressObj.longitude!)
        mapView.addAnnotation(mkAnnotation)
        }
    }
    func getNameByGeoCoder(latitude: Double, longitude: Double) {
        let location = CLLocation(latitude: latitude, longitude: longitude)

        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) {
        (placemarks, error) -> Void in
        self.mkAnnotation.title = ""
        if let mPlacemark = placemarks{
            if let dict = mPlacemark[0].addressDictionary as? [String: Any]{
                if let Name = dict["Name"] as? String{
                    if let State = dict["State"] as? String{
                        self.currentLocationStr = Name + ", " + State
                        self.mkAnnotation.title = self.currentLocationStr
                    }
                }
            }

        }

        }
    }
}


