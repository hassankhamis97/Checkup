//
//  PopUpTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/9/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SDWebImage
class PopUpTableViewController: UITableViewController {

    @IBOutlet weak var employeeImg: UIImageView!
    
    
    @IBOutlet weak var employeeName: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var employeeID : String?
    var phoneNumberArray=["No Phone Available"]
    
    
    
    @IBAction func closeBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
   override func viewWillAppear(_ animated: Bool) {
          var employeeDetailsPresenter : EmployeeDetailsPresenter = EmployeeDetailsPresenter(empViewRef : self)
    
    guard let eID = employeeID else{
        return
    }
    
    employeeDetailsPresenter.getEmployee(empId:eID )
     
    
           }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

                    // 8ZIq9b06ILYYpodM0pFGLkdD24c2
        employeeImg.layer.masksToBounds = false
        employeeImg.layer.cornerRadius=employeeImg.frame.width/2
        employeeImg.clipsToBounds = true
        employeeImg.layer.borderWidth=2
        employeeImg.layer.borderColor=UIColor.gray.cgColor
    
    }

}

extension PopUpTableViewController :UICollectionViewDelegate,UICollectionViewDataSource{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return phoneNumberArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PopUpCollectionViewCell
        
    
        cell.phoneLabel.text=phoneNumberArray[indexPath.item]
        
        return cell
    }
    
      
}

extension PopUpTableViewController : IEmployeeDetailsView {
    
 

    
    func onReceiveEmployeeDetails(employee: Employee) {
        
        if let imgPath = employee.imagePath  {
            if employee.imagePath != "" {
                self.employeeImg.sd_setImage(with: URL(string: imgPath), placeholderImage: UIImage(named: "placeholder.png"))
                
//                employeeImg = UIImageView(image: UIImage(named: imgPath))
            }}
        employeeName.text = employee.userName
            
        guard let phoneArr = employee.phones else {
            print("no Phone")
            return
        }
        phoneNumberArray = phoneArr
        collectionView.reloadData()
    }
    
    
//     func loadImage(url:String) {
//
//
//
//    let downloader = SDWebImageManager()
//
//
//
//     downloader.imageDownloader?.downloadImage(with: URL(string: url), options: .highPriority, progress: {
//             (receivedSize, expectedSize, url) in
//             // image is being downloading and you can monitor progress here
//                 }, completed: { (downloadedImage, data, error, success) in
//                     print(downloadedImage, data, success)
//                     //image is downloaded and ready to use
//                    self.employeeImg = UIImageView(image: downloadedImage)
//
//                    self.tableView.reloadData()
//                 })
//
//
//
//        }
    
    
}

