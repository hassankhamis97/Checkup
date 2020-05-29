//
//  LabDescTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SDWebImage
class LabDescTableViewController: UITableViewController , ILabDescView , FilterProtocol{
    
    
    
    
    
    @IBOutlet weak var errorLabelOutlet: UILabel!
    
    @IBOutlet weak var labBrachCollection: UICollectionView!
    @IBOutlet weak var labHotlineOutlet: UILabel!
    @IBOutlet weak var labImageViewOutlet: UIImageView!
    
    var isBottom : Bool = true
    var labDescPresenter : ILabDescPresenter!
    var labDescriptionObj : Branches = Branches()
    var paginatingParams: LabDescriptionParams = LabDescriptionParams()
    var labParamsInView : LabDescriptionParams = LabDescriptionParams()
    var filteredGovernId : Int!
    var filter : FilterLabTableView!
    var myId : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabelOutlet.alpha = 0
        
        labBrachCollection.register(UINib(nibName: "BranchesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "branchCell")
        
        
        labBrachCollection.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(navigateToFilter))
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 191, height: 213)
        layout.minimumInteritemSpacing = 1.0
        self.labBrachCollection?.collectionViewLayout = layout
        
        
        filteredGovernId = 0
        
        
        
        labParamsInView.governId = 1
        labParamsInView.labId = "-M7O-IStoBsiYrQFpwo_"
        labParamsInView.take = 5
        labParamsInView.skip = 0
        labParamsInView.longitude = 29.9137701
        labParamsInView.latitude = 31.1803167
        
        
        labDescPresenter =  LabDescPresenter(view: self)
        labDescPresenter.getDataFromLabDescModel(params: labParamsInView)
        
    }
    @objc func navigateToFilter() {
        filter = storyboard?.instantiateViewController(withIdentifier: "filterLab") as! FilterLabTableView
        filter.myFilterProtocol = self
        navigationController?.pushViewController(filter, animated: true)
        
    }
    
    
    
    func showingDataOnView(labDescObj: Branches , id: Int) {
        
        myId = id
        print("my id\(id)")
        
        //   labDescriptionObj = labDescObj
        // labImageViewOutlet.sd_setImage(with: URL(string: labDescriptionObj.labPhoto!), placeholderImage:UIImage(named: "placeholder.png"))
        
        
        if(filteredGovernId ==  nil){
            print("nil")                                                  // data didnt come from presenter
        }
        else{                                                            // if there is data
            print(filteredGovernId!)
            
            if(filteredGovernId! == 0){  // id governId == 0 which means there is no filter ,, return all data
                print("hey i am zero")
                // check on "skip" here
                print("skip")
                print(paginatingParams.skip)
                
                if(paginatingParams.skip == nil){
                    labDescriptionObj = labDescObj
                    labImageViewOutlet.sd_setImage(with: URL(string: labDescriptionObj.labPhoto!), placeholderImage:UIImage(named: "placeholder.png"))
                }else if(paginatingParams.skip == 0){
                    labDescriptionObj = labDescObj
                    print("take : \(paginatingParams.take)")
                    print("skip when its 0 : \(paginatingParams.skip)")
                }else{
                    labDescriptionObj = labDescObj
                    for branch in labDescriptionObj.branches!{
                        labDescriptionObj.branches?.append(branch)
                        print("take : \(paginatingParams.take)")
                        print("skip : \(paginatingParams.skip)")
                        
                        
                       
                        
                     
                        
                    }
                    
                    /*   if(labDescObj.branches?.count == 0){
                        labBrachCollection.isScrollEnabled = false
                        labBrachCollection.setContentOffset(labBrachCollection.contentOffset, animated: false)
                    }*/
                    /*
                     if(labDescObj.branches == nil){
                                                paginatingParams.skip = 0
                                            }
                                            
                     */
                    
                }
            }else if(filteredGovernId! == id){
                // id  governId == the id that the user is pressed which means that
                //there is a filter then return all the data related to this filter
                
                labDescriptionObj = labDescObj
                
                
                if(labDescriptionObj.branches?.count == 0){  //which mean that, that this branch doesn't have data
                    errorLabelOutlet.alpha = 1
                }
                else{
                    labImageViewOutlet.sd_setImage(with: URL(string: labDescriptionObj.labPhoto!), placeholderImage:UIImage(named: "placeholder.png"))
                    print("hey i am a number")
                }
                
                
            }else{
                print("hey i have no data")
                
            }
        }
        
        
        labBrachCollection.reloadData()
    }
    
    
    func passingDataFromFilterToDesc(governId: Int) {
        filteredGovernId = governId
        print("inside the protocol")
        print(filteredGovernId!)
        labParamsInView.governId = governId
        labDescPresenter.getDataFromLabDescModel(params: labParamsInView)
        
        
    }
    
}



//     let screenSIze = UIScreen.main.bounds
//   let width = screenSIze.width
// let height = screenSIze.height-200
