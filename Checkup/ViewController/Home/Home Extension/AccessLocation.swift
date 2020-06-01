//
//  AccessLocation.swift
//  Checkup
//
//  Created by Hassan Khamis on 6/1/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//


import Foundation
import MapKit

extension HomeViewController : MKMapViewDelegate,CLLocationManagerDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
         if let annotationView=mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView
         {
         annotationView.animatesWhenAdded=true
         annotationView.titleVisibility = .adaptive
         
         return annotationView
         }
     
    return nil
     }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let mUserLocation:CLLocation = locations[0] as CLLocation

            let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
//            let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//
//            mapView.setRegion(mRegion, animated: true)
        
         self.setUsersClosestLocation(mLattitude: mUserLocation.coordinate.latitude, mLongitude: mUserLocation.coordinate.longitude)
        }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Error - locationManager: \(error.localizedDescription)")
        }
}

