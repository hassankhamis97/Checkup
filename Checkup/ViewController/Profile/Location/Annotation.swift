//
//  Annotation.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/17/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import MapKit
class Annotation :NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate:CLLocationCoordinate2D,title:String?,subtitle:String?){
        self.coordinate=coordinate
        self.title=title
        self.subtitle=subtitle
        super.init()
        
    }
}
