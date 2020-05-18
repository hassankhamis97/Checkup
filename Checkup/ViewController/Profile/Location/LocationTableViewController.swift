//
//  LocationTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import MapKit
import SkyFloatingLabelTextField

class LocationTableViewController: UITableViewController {
    

    @IBOutlet weak var addressTextField: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var buildingNumberTextField: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var floorNumTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var apartmentNumTextField: SkyFloatingLabelTextField!
    
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var flag=0
    var longitude:Double=0.0
    var lat:Double=0.0
    
    var addressObj=Address()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressTextField?.text=addressObj.address
        buildingNumberTextField.text=addressObj.buildingNo
        floorNumTextField.text=addressObj.floorNo
        apartmentNumTextField.text=addressObj.apartmentNo
        if let longi = Double(addressObj.longitude!){
                 longitude=longi
              }
        if let latit = Double(addressObj.latitude!){
                       lat=latit
                    }
        
        
        
        if (flag>0)
        {
            let vc = (
                storyboard?.instantiateViewController(
                    withIdentifier: "locPopUpSVC"))!
            present(vc, animated: true, completion: nil)
            
        }
            
        else{
            mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: longitude)
            
            let locAnnotation=Annotation(coordinate: coordinates, title: addressObj.address, subtitle: "")
            mapView.addAnnotation(locAnnotation)
            
            
            
            addressTextField.isEnabled=false
            buildingNumberTextField.isEnabled=false
            floorNumTextField.isEnabled=false
            apartmentNumTextField.isEnabled=false
            
            
        }
    }
    
    
    
    @IBAction func saveLocationBtn(_ sender: Any) {
    }
    
    
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(flag==0)
        {
            
            if (indexPath.row==0||indexPath.row==1||indexPath.row==2)
            {
                return 80
            }
            
            if(indexPath.row==3||indexPath.row==5){
                
                return 0
                
            }
            
            if(indexPath.row==4){
                
                return 370
                
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
                
                return 295
                
            }
            
            if(indexPath.row==5){
                
                return 85
                
            }
            
            
        }
        
        return tableView.rowHeight
        
    }
    
    
    
    
    
    
    
    
    
}

