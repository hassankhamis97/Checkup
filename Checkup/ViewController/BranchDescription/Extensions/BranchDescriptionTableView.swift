//
//  BranchDescriptionTableView.swift
//  Checkup
//
//  Created by Aya on 5/16/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
import MapKit
extension BranchDescriptionViewController: UITableViewDataSource, UITableViewDelegate {
   
    
 func numberOfSectionsInTableView(tableView: UITableView) -> Int {
 return 1
 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return 9
 }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height : CGFloat = CGFloat()
        if(indexPath.row == 0){
            height = 70
        }else if(indexPath.row == 1){
            height = 70
            
        }else if(indexPath.row == 2){
            height = 70
            
        }else if(indexPath.row == 3){
            height = 70
            
        }else if(indexPath.row == 4){
            height = 70
            
        }else if(indexPath.row == 5){
            height = 70
            
        }else if(indexPath.row == 6){
            height = 70
            
        }else if(indexPath.row == 7){
        height = 300
        
        }else if(indexPath.row == 8){
            height = 75
            
        }
        return height
    }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell()
   //   cell.textLabel!.text = "Cell \(indexPath.row)"
    var myTag = cell.tag
    myTag = indexPath.row
    print(myTag)
    if(myTag == 0){
        let firstCell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstStaticTableViewCell
        firstCell.firstLabNameOutlet.text = "El-Mokhtbar"
        return firstCell
        
    }else if(myTag==1){
        let secCell = tableView.dequeueReusableCell(withIdentifier: "secCell", for: indexPath) as! SecStaticTableViewCell
        return secCell
        
    }else if(myTag==2){
      let thirdCell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as! ThirdStaticTableViewCell
      return thirdCell
        
    }else if(myTag==3){
      let fourthCell = tableView.dequeueReusableCell(withIdentifier: "fourthCell", for: indexPath) as! FourthStaticTableViewCell
      return fourthCell
    }
    else if(myTag==4){
    let fifthCell = tableView.dequeueReusableCell(withIdentifier: "fifthCell", for: indexPath) as! FifthStaticTableViewCell
    return fifthCell
    }else if(myTag==5){
    let sixthCell = tableView.dequeueReusableCell(withIdentifier: "sixthCell", for: indexPath) as! SisxthStaticTableViewCell
    return sixthCell
    }
    else if(myTag==6){
    let seventhCell = tableView.dequeueReusableCell(withIdentifier: "seventhCell", for: indexPath) as! SeventhStaticTableViewCell
    return seventhCell
        
    } else if(myTag==7){
        let eighthCell = tableView.dequeueReusableCell(withIdentifier: "eighthCell", for: indexPath) as! EighthStaticTableViewCell
            let annotation = MKPointAnnotation()
            annotation.title = "Your Lab"
            annotation.coordinate = CLLocationCoordinate2D(latitude: 26.820553, longitude: 30.802498)
            
        eighthCell.LabMapOutlet.addAnnotation(annotation)
     
        
       return eighthCell
        
    } else if(myTag==8){
          let ningthCell = tableView.dequeueReusableCell(withIdentifier: "ningthCell", for: indexPath) as! NinthStaticTableViewCell
          return ningthCell
       }
       
    
    
    
    
      return cell
  }
}

/*

override func viewWillAppear(_ animated: Bool) {

     //  let myLocation = CLLocationCoordinate2D(latitude: 26.820553, longitude: 30.802498)
   
    /*   let placeMark = MKPlacemark(coordinate: myLocation)
       let mapItem = MKMapItem(placemark: placeMark)
       mapItem.name = "Your Lab"
   */
   
       let annotation = MKPointAnnotation()
       annotation.title = "Your Lab"
       annotation.coordinate = CLLocationCoordinate2D(latitude: 26.820553, longitude: 30.802498)
       
       myMap.addAnnotation(annotation)
   
       
       
       
       //myMap.setCenter(myLocation, animated: true)
   }


*/
