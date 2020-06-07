//
//  ReqPopUpLocationViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ReqPopUpLocationViewController: UIViewController {

// let locationManager = CLLocationManager()
    var reqLocationRef: ICheckLocation!
    @IBAction func autoLocateBtn(_ sender: Any) {
        
        reqLocationRef.checkLocationMethod(isAuto: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func setManuallyBtn(_ sender: Any) {
        reqLocationRef.checkLocationMethod(isAuto: false)

               dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var autoLocateOutlet: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        autoLocateOutlet.layer.cornerRadius=10
       
    }
    
}
