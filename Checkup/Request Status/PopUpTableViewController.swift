//
//  PopUpTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/9/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class PopUpTableViewController: UITableViewController {

    @IBOutlet weak var employeeImg: UIImageView!
    
    
    @IBOutlet weak var employeeName: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var phoneNumberArray=["0100234599","0115695430","01287590765"]
    
    
    
    @IBAction func closeBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
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

