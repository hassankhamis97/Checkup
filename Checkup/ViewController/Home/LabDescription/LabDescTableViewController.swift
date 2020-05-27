//
//  LabDescTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SDWebImage
class LabDescTableViewController: UITableViewController , ILabDescView{
   
    
    @IBOutlet weak var labBrachCollection: UICollectionView!
    @IBOutlet weak var labHotlineOutlet: UILabel!
    @IBOutlet weak var labImageViewOutlet: UIImageView!
    
    
    var labDescPresenter : ILabDescPresenter!
    var labDescriptionObj : Branches = Branches()
    var labParamsInView : LabDescriptionParams = LabDescriptionParams()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        labBrachCollection.register(UINib(nibName: "BranchesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "branchCell")
       
       
        labBrachCollection.delegate = self
        
        
      
//       navigationItem.leftBarButtonItem = UIBarButtonItem(title: "description", style: .plain, target: self, action: #selector(navigateToDesc))
       
        
        
       let layout = UICollectionViewFlowLayout()
       layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
       layout.itemSize = CGSize(width: 191, height: 213)
       layout.minimumInteritemSpacing = 1.0
       self.labBrachCollection?.collectionViewLayout = layout
    
        
        
        
        labParamsInView.governId = 1
        labParamsInView.labId = "-M7O-IStoBsiYrQFpwo_"
        labParamsInView.take = 5
        labParamsInView.skip = 0
        labParamsInView.longitude = 29.9137701
        labParamsInView.latitude = 31.1803167
        
        
        labDescPresenter =  LabDescPresenter(view: self)
        labDescPresenter.getDataFromLabDescModel(params: labParamsInView)
        
    }
    
    
//    @objc func navigateToDesc() {
//        let branchDesc = self.storyboard!.instantiateViewController(withIdentifier: "branchDesc") as! BranchDescriptionViewController
//        branchDesc.modalPresentationStyle = .fullScreen
//        self.present(branchDesc , animated: true , completion: nil)
//        
//    }
    

    func showingDataOnView(labDescObj: Branches) {
        labDescriptionObj = labDescObj
        print("inside the view : \(labDescriptionObj)")
        print(labDescriptionObj.branches!.count)
        labImageViewOutlet.sd_setImage(with: URL(string: labDescriptionObj.labPhoto!), placeholderImage:UIImage(named: "placeholder.png"))
        
        labBrachCollection.reloadData()
    }
    
   /* func paginatingData() {
        print("inside paging data")
        if(labDescriptionObj.branches != nil){
            for branch in labDescriptionObj.branches! {
                labDescriptionObj.branches!.append(branch)
                print("branch\(branch)")
                labBrachCollection.reloadData()

            }
            labBrachCollection.reloadData()

            print(labDescriptionObj.branches!.count)

        }

       }*/
    
}


//var labBranches : [String] = ["Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch","Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch","Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch","Alexandria branch" , "Cairo branch" , "Mansoura branch" , "branch"]
  






//     let screenSIze = UIScreen.main.bounds
//   let width = screenSIze.width
  // let height = screenSIze.height-200
