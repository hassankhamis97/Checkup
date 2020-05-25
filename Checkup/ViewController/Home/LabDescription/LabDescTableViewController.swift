//
//  LabDescTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SDWebImage
class LabDescTableViewController: UITableViewController , ILabDescView {
    
    @IBOutlet weak var labHotlineOutlet: UILabel!
    @IBOutlet weak var labImageViewOutlet: UIImageView!
    var labDescPresenter : ILabDescPresenter!
    var labDescriptionObj : Branches = Branches()
   


    @IBOutlet weak var labBrachCollection: UICollectionView!
    var labBranches : [String] = ["Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch","Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch","Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch","Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        labBrachCollection.register(UINib(nibName: "BranchesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "branchCell")
            let layout = UICollectionViewFlowLayout()
      
       navigationItem.leftBarButtonItem = UIBarButtonItem(title: "description", style: .plain, target: self, action: #selector(navigateToDesc))
        
   //     let screenSIze = UIScreen.main.bounds
     //   let width = screenSIze.width
       // let height = screenSIze.height-200
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
     //   layout.itemSize = CGSize(width: width/2 , height: height/2)
           //layout.itemSize = CGSize(width: 200/2, height: 200/2)
        layout.itemSize = CGSize(width: 191, height: 213)
       layout.minimumInteritemSpacing = 1.0
       self.labBrachCollection?.collectionViewLayout = layout
        
        labDescPresenter =  LabDescPresenter(view: self)
        labDescPresenter.getDataFromLabDescModel()
        
    }
    @objc func navigateToDesc() {
        let branchDesc = self.storyboard!.instantiateViewController(withIdentifier: "branchDesc") as! BranchDescriptionViewController
        branchDesc.modalPresentationStyle = .fullScreen
        self.present(branchDesc , animated: true , completion: nil)
        
    }

    func showingDataOnView(labDescObj: Branches) {
        labDescriptionObj = labDescObj
        print("inside the view : \(labDescriptionObj)")
        print(labDescriptionObj.branches!.count)
        labImageViewOutlet.sd_setImage(with: URL(string: labDescriptionObj.labPhoto!), placeholderImage:UIImage(named: "placeholder.png"))
        
        labBrachCollection.reloadData()
    }
    
    
    
}

