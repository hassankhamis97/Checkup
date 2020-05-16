//
//  HomeTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import ImageSlideshow
import Firebase
class HomeTableViewController: UITableViewController   {
    
    var labFilter : FilterLabTableView!
    var labNames = ["El-Mokhtabar" , "Alpha" , "El-Borg" , "El-Mokhtabar"]
    var labImages = ["mokhtabar" , "alpha" , "borg" ,"mokhtabar" ]
    var labDate = ["21/2/2005" , "1/11/2019" , "5/9/2008" , "8/6/2016"]
    
    
    @IBOutlet weak var labCollection: UICollectionView!
    

    @IBOutlet weak var labSlideShow: ImageSlideshow!
    
    
    let pageIndicator = UIPageControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        
//        var labObj = Laboratory(id: "", name: "El Mokhtabar", formalReferencePathId: "", specialTests: "", image: "", branches: ["",""])
//        
//        var ref: DatabaseReference!
//
//        ref = Database.database().reference()
//        var id = ref.childByAutoId()
//        labObj.id = id.key! as! String
//        ref.child("Lab").child(labObj.id!).setValue(labObj.toDictionary())
//        
//        
        
        var reatTime = RealTime()
//        reatTime.addLab(name: "lab10", image:  "")
        var p1 = Phone(number: "03482584", isLand: true)
        var p2 = Phone(number: "01111111", isLand: false)
        var phoneArr = [Phone]()
        phoneArr.append(p1)
        phoneArr.append(p2)
        var addressObj = Address(address: "dsadsa", buildingNo: "2", floorNo: "5", apartmentNo: "5", longitude: "54818", latitude: "41548")
//        var addressObj = Address()
        reatTime.addUser(id: "gLcrV5nCzhREMdrgH57eDfRanr22", email: "asd@asd.com", password: "123456789Iti", birthdate: "", gender: "", phone:phoneArr , insurance: "", address: addressObj, imagePath: "https://firebasestorage.googleapis.com/v0/b/checkup-23ffe.appspot.com/o/images%2FgLcrV5nCzhREMdrgH57eDfRanr22%2FScreenshot_1585998573.png?alt=media&token=173f3e89-878b-4950-bd3b-40eefb2e5b8f")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterTapped))
        
        
        
        
        let layout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
               layout.itemSize = CGSize(width: 200, height: 240)  //233
        layout.minimumInteritemSpacing = 0.05
        
              self.labCollection?.collectionViewLayout = layout
           
        
        labSlideShow.setImageInputs([
                                     ImageSource(image: UIImage(named: "borg")!),
                                     ImageSource(image: UIImage(named: "alpha")!),
                                     ImageSource(image: UIImage(named: "mokhtabar")!),
                                     ImageSource(image: UIImage(named: "borg")!)
        ])
        
        labSlideShow.slideshowInterval = 3
        labSlideShow.contentScaleMode = .scaleToFill
        
        labSlideShow.delegate = self
        
        
        pageIndicator.currentPageIndicatorTintColor = UIColor.black
        pageIndicator.pageIndicatorTintColor = UIColor.black
        labSlideShow.pageIndicator = pageIndicator
        labSlideShow.activityIndicator = DefaultActivityIndicator()
        
        
    }
   
    @objc func filterTapped(){
         if #available(iOS 13.0, *) {
            labFilter = storyboard?.instantiateViewController(identifier: "filterLab") as! FilterLabTableView
         } else {
             
         }
             navigationController?.pushViewController(labFilter, animated: true)
            
        }
}




extension HomeTableViewController: ImageSlideshowDelegate {
  
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int){
        print("current page:", page)
    }
}
extension HomeTableViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labCell", for: indexPath) as! LabsCollectionViewCell
        
        cell.labImageVIew.image = UIImage(named: labImages[indexPath.row])
        //cell.labImageVIew.layer.cornerRadius = cell.labImageVIew.frame.height/2
        cell.labImageVIew.layer.cornerRadius = 15
        cell.labRating.rating = 3
        
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.borderWidth = 5.0
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    
    
}
