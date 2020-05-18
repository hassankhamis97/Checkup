//
//  AddressLocationView.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import MapKit
extension ReqLocationTableViewController : MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
         if let annotationView=mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView
         {
         annotationView.animatesWhenAdded=true
         annotationView.titleVisibility = .adaptive
         
         return annotationView
         }
     
    return nil
     }
}
