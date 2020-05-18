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
class ReqLocationTableViewController: UITableViewController {

    @IBOutlet var addressTxt: SkyFloatingLabelTextField!
    @IBOutlet var buildingNoTxt: SkyFloatingLabelTextField!
   
    @IBOutlet var floorNoTxt: SkyFloatingLabelTextField!
    @IBOutlet var ApartmentNoTxt: SkyFloatingLabelTextField!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = (
              storyboard?.instantiateViewController(
              withIdentifier: "ReqLocPopUpSVC"))!
          present(vc, animated: true, completion: nil)
           }

        
        
    }


