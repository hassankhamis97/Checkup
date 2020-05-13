//
//  HomeTableViewController.swift
//  Checkup
//
//  Created by Aya on 5/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import ImageSlideshow
class HomeTableViewController: UITableViewController   {
    
    var labFilter : FilterLabTableView!
    var labNames = ["El-Mokhtabar" , "Alpha" , "El-Borg"]
    var labImages = ["mokhtabar" , "alpha" , "borg"]
    var labDate = ["21/2/2005" , "1/11/2019" , "5/9/2008"]
    
    
    @IBOutlet weak var labCollection: UICollectionView!
    

    @IBOutlet weak var labSlideShow: ImageSlideshow!
    
    
    let pageIndicator = UIPageControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterTapped))
        
        labSlideShow.setImageInputs([
                                     ImageSource(image: UIImage(named: "lab1")!),
                                     ImageSource(image: UIImage(named: "lab2")!),
                                     ImageSource(image: UIImage(named: "lab3")!),
                                     ImageSource(image: UIImage(named: "lab4")!)
        ])
        
        labSlideShow.slideshowInterval = 3
        labSlideShow.contentScaleMode = .scaleAspectFill
        
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
extension HomeTableViewController : UICollectionViewDelegate , UICollectionViewDataSource {
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
