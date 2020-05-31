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
 return 10
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
            
        }else if(indexPath.row == 8){
        height = 300
        
        }else if(indexPath.row == 9){
            height = 75
            
        }else if(indexPath.row == 7){
            height = 104
            
        }
        return height
    }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell()
    var myTag = cell.tag
    myTag = indexPath.row
    print(myTag)
    
   if(branchDescriptionView != nil){
    
    if(myTag == 0){
        let firstCell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstStaticTableViewCell
        firstCell.firstLabNameOutlet.text = branchDescriptionView.labName!
        return firstCell
        
    }else if(myTag==1){
        let secCell = tableView.dequeueReusableCell(withIdentifier: "secCell", for: indexPath) as! SecStaticTableViewCell
        secCell.labGovernOutlet.text = branchDescriptionView.govern!
        return secCell
        
    }else if(myTag==2){
      let thirdCell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as! ThirdStaticTableViewCell
        thirdCell.labAddressOutlet.text = branchDescriptionView.address?.address1!
      return thirdCell
        
    }else if(myTag==3){
      let fourthCell = tableView.dequeueReusableCell(withIdentifier: "fourthCell", for: indexPath) as! FourthStaticTableViewCell
        fourthCell.labPhoneOutlet.text = branchDescriptionView.phone!
      return fourthCell
    }
    else if(myTag==4){
    let fifthCell = tableView.dequeueReusableCell(withIdentifier: "fifthCell", for: indexPath) as! FifthStaticTableViewCell
      //  fifthCell.labHolidayOutlet.text = branchDescriptionView.holidays!      NOT IN API
    return fifthCell
    }else if(myTag==5){
    let sixthCell = tableView.dequeueReusableCell(withIdentifier: "sixthCell", for: indexPath) as! SisxthStaticTableViewCell
        var workTime = branchDescriptionView.timeFrom! + branchDescriptionView.timeTo!
           sixthCell.labWorkOutlet.text = workTime
    return sixthCell
    }
    else if(myTag==6){
    let seventhCell = tableView.dequeueReusableCell(withIdentifier: "seventhCell", for: indexPath) as! SeventhStaticTableViewCell
        seventhCell.labAvailableOutelt.text = String(branchDescriptionView.isAvailableFromHome)
    return seventhCell
        
    } else if(myTag==8){
        let eighthCell = tableView.dequeueReusableCell(withIdentifier: "eighthCell", for: indexPath) as! EighthStaticTableViewCell
            let annotation = MKPointAnnotation()
            annotation.title = branchDescriptionView.labName!
//        annotation.coordinate = CLLocationCoordinate2D(latitude: (branchDescriptionView.address?.latitude)!, longitude: (branchDescriptionView.address?.longitude)!)
        annotation.coordinate = CLLocationCoordinate2D(latitude: branchDescriptionView.address!.latitude!, longitude: branchDescriptionView.address!.longitude!)
        eighthCell.LabMapOutlet.addAnnotation(annotation)
       return eighthCell
        
    } else if(myTag==9){
          let ningthCell = tableView.dequeueReusableCell(withIdentifier: "ningthCell", for: indexPath) as! NinthStaticTableViewCell
        ningthCell.latitude = branchDescriptionView.address!.latitude
        ningthCell.longitude = branchDescriptionView.address!.longitude
        ningthCell.name = branchDescriptionView.labName!
          return ningthCell
       }
    
    else if(myTag==7){
       let reviewsCell = tableView.dequeueReusableCell(withIdentifier: "reviewsCell", for: indexPath) as! ReviewsTableViewCell
        reviewsCell.readMoreOutlet.addTarget(self, action: #selector(reviewsNavigation), for: .touchUpInside)
    
        let reviews = self.storyboard?.instantiateViewController(withIdentifier: "reviews") as! ReviewsTableViewController
        self.navigationController?.pushViewController(reviews, animated: true)
   
       return reviewsCell
    }
    
   }
      return cell
  }
    @objc func reviewsNavigation(_ sender : UIButton){
         sender.pulsate()
         let reviews = storyboard!.instantiateViewController(withIdentifier: "reviews") as! ReviewsTableViewController
           navigationController?.pushViewController(reviews, animated: true)
        if(true) {
            let reviews = storyboard!.instantiateViewController(withIdentifier: "reviews") as! ReviewsTableViewController
            navigationController?.pushViewController(reviews, animated: true)
            print("pressed")
         //   reviews.modalPresentationStyle = .fullScreen
           // present(reviews, animated: true, completion: nil)
         
         }
         else{
         }

     
     }

}
/*
 reviewsCell
 
 filter = storyboard?.instantiateViewController(withIdentifier: "filterLab") as! FilterLabTableView
       filter.myFilterProtocol = self
       navigationController?.pushViewController(filter, animated: true)
 
 
 */
