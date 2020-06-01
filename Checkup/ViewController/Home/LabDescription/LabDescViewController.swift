//
//  LabDescViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 6/1/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import SDWebImage
class LabDescViewController: UIViewController , ILabDescView , FilterProtocol , IView{
    func showIndicator() {
        isLoading = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        labsActicity.show()
        labsActicity.startAnimating()
//        bran.reloadData()
    }
    
    func hideIndicator() {
        isLoading = false
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        labsActicity.stopAnimating()
        labsActicity.hide()
//        labCollection.reloadData()
    }
    
    func errorMessage(msg: String) {
        Alert.showSimpleAlert(title: "sorry", message: "No Internet Connection", viewRef: self)
    }
    
        @IBOutlet weak var labsActicity: UIActivityIndicatorView!
        @IBOutlet weak var errorLabelOutlet: UILabel!
        
        @IBOutlet weak var labBrachCollection: UICollectionView!
        @IBOutlet weak var labHotlineOutlet: UILabel!
        @IBOutlet weak var labImageViewOutlet: UIImageView!
        @IBOutlet var topViewConstraint: NSLayoutConstraint!
        @IBOutlet var headerViewHeight: NSLayoutConstraint!
//        var reach : Bool = false
        //    var cellWidth : CGSize!
        let imageViewMaxHeight : CGFloat = 228
        let imageViewMinHeight : CGFloat = 0
        let topViewConstrainsMaxHeight : CGFloat = 0
        let topViewConstrainsMinHeight : CGFloat = -228
    
        var isBottom : Bool = true
        var labDescPresenter : ILabDescPresenter!
        var labDescriptionObj : Branches = Branches()
        var paginatingParams: LabDescriptionParams = LabDescriptionParams()
        var labParamsInView : LabDescriptionParams = LabDescriptionParams()
        var filteredGovernId : Int!
        var filter : FilterLabTableView!
        var myId : Int!
        var labId : String!
    var isLoading = false
    override func viewWillAppear(_ animated: Bool) {
        self.headerViewHeight.constant = self.imageViewMaxHeight
        self.topViewConstraint.constant =  topViewConstrainsMaxHeight
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            errorLabelOutlet.alpha = 0
            paginatingParams.skip = 0
            labBrachCollection.register(UINib(nibName: "BranchesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "branchCell")
            
            labBrachCollection.delegate = self
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(navigateToFilter))
            
//
//            let layout = UICollectionViewFlowLayout()
//            layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//            layout.itemSize = CGSize(width: 191, height: 213)
//            layout.minimumInteritemSpacing = 1.0
//            self.labBrachCollection?.collectionViewLayout = layout
            
            
            filteredGovernId = 0
            
            paginatingParams.governId = 0
            paginatingParams.labId = labId
            paginatingParams.latitude = 31.1803167
            paginatingParams.longitude = 29.9137701
            paginatingParams.take = 6
            paginatingParams.skip =  0
            
            
    //        labParamsInView.governId = 1
    //        labParamsInView.labId = "-M7O-IStoBsiYrQFpwo_"
    //        labParamsInView.take = 5
    //        labParamsInView.skip = 0
    //        labParamsInView.longitude = 29.9137701
    //        labParamsInView.latitude = 31.1803167
            labsActicity.transform = CGAffineTransform.init(scaleX: 2, y: 2)

            
            labDescPresenter =  LabDescPresenter(view: self)
            labDescPresenter.getDataFromLabDescModel(params: paginatingParams)
            
        }
        @objc func navigateToFilter() {
            filter = storyboard?.instantiateViewController(withIdentifier: "filterLab") as! FilterLabTableView
            filter.myFilterProtocol = self
            navigationController?.pushViewController(filter, animated: true)
            
        }
        
        
        
        func showingDataOnView(labDescObj: Branches , id: Int) {
            isBottom = false
    //        myId = id
    //        print("my id\(id)")
                                                   // if there is data
                
    //            if(filteredGovernId! == 0){  // id governId == 0 which means there is no filter ,, return all data
                    print("hey i am zero")
         
                    
                    if(paginatingParams.skip == 0){
                        labDescriptionObj = labDescObj
                        labImageViewOutlet.sd_setImage(with: URL(string: labDescriptionObj.labPhoto!), placeholderImage:UIImage(named: "placeholder.png"))
                    }else{
    //                    labDescriptionObj = labDescObj
                        for branch in labDescObj.branches!{
                            labDescriptionObj.branches?.append(branch)
                        }
                        
                    }
    //            }
    //            else if(filteredGovernId! == id){
    //                // id  governId == the id that the user is pressed which means that
    //                //there is a filter then return all the data related to this filter
    //
    //                labDescriptionObj = labDescObj
    //
    //
    //                if(labDescriptionObj.branches?.count == 0){  //which mean that, that this branch doesn't have data
    //                    errorLabelOutlet.alpha = 1
    //                }
    //
    //
    //            }
    //            else{
    //                print("hey i have no data")
    //
    //            }
            
            
            labBrachCollection.reloadData()
        }
        
        
        func passingDataFromFilterToDesc(governId: Int) {
            if filteredGovernId != governId {
                filteredGovernId = governId
                paginatingParams.governId = governId
                paginatingParams.skip = 0
                paginatingParams.take = 1000
                labDescPresenter.getDataFromLabDescModel(params: paginatingParams)
            }
            
            
        }

}
