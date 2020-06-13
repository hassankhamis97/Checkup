//
//  BranchTableViewController.swift
//  Checkup
//
//  Created by Aya on 6/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SDWebImage
import Cosmos
import MapKit
class BranchTableViewController: UITableViewController, IBranchDescView  {
 
    @IBOutlet weak var ratingOultet: CosmosView!
    @IBOutlet weak var contactsTableView: ContactsTableView!
    @IBOutlet weak var apartmentOutlet: UILabel!
    @IBOutlet weak var floorNoOutlet: UILabel!
    @IBOutlet weak var buildingNoOutlet: UILabel!
    @IBOutlet weak var addressOutlet: UILabel!
    @IBOutlet weak var mapOutlet: MKMapView!
    @IBOutlet weak var workTimeOutlet: UILabel!
    @IBOutlet weak var workDaysOutlet: UILabel!
    
    @IBAction func labDirectionAction(_ sender: Any) {
        
        
               let regionDistance : CLLocationDistance = 1000
               let coordinates = CLLocationCoordinate2DMake(branchObj.address!.latitude!, branchObj.address!.longitude!)
               let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
               let options = [MKLaunchOptionsMapCenterKey : NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey : NSValue(mkCoordinateSpan: regionSpan.span)]
               let placeMark = MKPlacemark(coordinate: coordinates)
               let mapItem = MKMapItem(placemark: placeMark)
               mapItem.name = branchObj.labName!
               
               mapItem.openInMaps(launchOptions: options)
        
    }
    @IBOutlet weak var availableOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!
    
    @IBOutlet weak var labImageOutlet: UIImageView!
    var branchObj : BranchDescription!
    var branchDescPresenter : IBranchDescPresenter!
    var dataSource : TableDataSource!
    var branchId : String!
    var phones : [Phone]!
    var myPhone  : Phone!
    override func viewDidLoad() {
       
        
        super.viewDidLoad()
        print("aya")
        phones = [Phone]()
        branchDescPresenter = BranchDescPresenter(view: self)
        branchDescPresenter.getDataFromModel(id: branchId!)
        
        
    
    }


    func showDataToView(barnchDescObjInView: BranchDescription) {
         branchObj = barnchDescObjInView
        if(branchObj != nil){
            print(branchObj!)
            availableOutlet.text = String(branchObj.isAvailableFromHome)
            apartmentOutlet.text = branchObj.address!.apartmentNo!
            floorNoOutlet.text = branchObj.address?.floorNo!
            buildingNoOutlet.text = branchObj.address?.buildingNo!
            addressOutlet.text = branchObj.address?.address1!
            ratingOultet.rating = branchObj.ratingReviewNo!
            nameOutlet.text = branchObj.labName!
            workTimeOutlet.text = branchObj.timeFrom! + "to" + branchObj.timeTo!
            workDaysOutlet.text =  ("Everday except \(branchObj.holidays!)")
            
            
           
           
           labImageOutlet.sd_setImage(with: URL(string: branchObj.branchPhoto!), placeholderImage:UIImage(named: "placeholder.png"))
            
            
            let annotation = MKPointAnnotation()
            annotation.title = branchObj.labName!
            annotation.coordinate = CLLocationCoordinate2D(latitude: branchObj.address!.latitude!, longitude: branchObj.address!.longitude!)
            mapOutlet.addAnnotation(annotation)
            
          
           var phoneNumbers = branchObj.phone!.components(separatedBy: "-")
            print(phoneNumbers)
            for phone in phoneNumbers{
           
               myPhone = Phone(number: phone, isLand: false)
                print(myPhone!)
             
               phones.append(myPhone!)
                
            }
            
             dataSource = TableDataSource(phoneList: phones)
             contactsTableView.dataSource = dataSource
             contactsTableView.delegate = dataSource

             tableView.reloadData()
        }
     }
     

}

