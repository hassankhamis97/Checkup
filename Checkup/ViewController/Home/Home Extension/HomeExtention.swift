//
//  HomeExtention.swift
//  Checkup
//
//  Created by azab on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
import ImageSlideshow

extension HomeTableViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ImageSlideshowDelegate, IGetLabsView {
    
    
    
    func getLabsForRender(homeLabs: [HomeLab]) {
        DispatchQueue.main.async {
            self.homeLabArr = homeLabs
            self.showSlider()
            self.labCollection.reloadData()
        }
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func errorMessage(msg: String) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeLabArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labCell", for: indexPath) as! LabsCollectionViewCell
        
        cell.labImageVIew.image = UIImage(named: homeLabArr?[indexPath.row].labPhoto ?? "")
        cell.labRating.rating =  (homeLabArr?[indexPath.row].rating as! NSString).doubleValue
        cell.labHotLine.text = homeLabArr?[indexPath.row].hotline
        //cell.labImageVIew.layer.cornerRadius = cell.labImageVIew.frame.height/2
        cell.labImageVIew.layer.cornerRadius = 15
        //        cell.labRating.rating = 3
        
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.borderWidth = 5.0
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var labDesc = storyboard?.instantiateViewController(withIdentifier: "labDescSCV")as! LabDescTableViewController
        navigationController?.pushViewController(labDesc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView.bounds.maxY >= collectionView.contentSize.height && reach == false {
            
            print("reached")
            reach = true
        } else if collectionView.bounds.maxY >= collectionView.contentSize.height && reach == true {
            
            reach = false
        }
    }
    
    func showSlider() {
       
        var slideShowImgs: [InputSource] = [InputSource]()
        if homeLabArr?.count ?? 0 > 0{
            for i in homeLabArr! {
                slideShowImgs.append(ImageSource(image: UIImage(named: i.labPhoto ?? "")!))
            }
        }
        
        labSlideShow.setImageInputs(
            slideShowImgs
            //            [
            //            ImageSource(image: UIImage(named: "borg")!),
            //            ImageSource(image: UIImage(named: "alpha")!),
            //            ImageSource(image: UIImage(named: "mokhtabar")!),
            //            ImageSource(image: UIImage(named: "borg")!)
            //        ]
        )
        
        labSlideShow.slideshowInterval = 3
        labSlideShow.contentScaleMode = .scaleToFill
        
        labSlideShow.delegate = self
        
        
        pageIndicator.currentPageIndicatorTintColor = UIColor.black
        pageIndicator.pageIndicatorTintColor = UIColor.black
        labSlideShow.pageIndicator = pageIndicator
        labSlideShow.activityIndicator = DefaultActivityIndicator()
    }
    
}
