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
import SDWebImage

extension HomeTableViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ImageSlideshowDelegate, IGetLabsView,  UISearchBarDelegate {
    
    func getSearchedLabs(seachedHomeLabs: [HomeLab]) {
        
        self.searchedHomeLabsArr = seachedHomeLabs
        self.labCollection.reloadData()
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
        homeLabPresenter.getSearchedLabs(name: searchText)
        
        //        searchBar
        
        //        filteredNames = allNames.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        //        searching = true
        //        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text=""
        //        searching = false
        //        tableView.reloadData()
        
    }
    
    
    func getLabsForRender(homeLabs: [HomeLab]) {
        for i in homeLabs{
            self.homeLabArr.append(i)
        }
        if homeLabs.count > 0 {
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
        if searchedHomeLabsArr.count > 0{
            return searchedHomeLabsArr.count
        } else {
            return homeLabArr.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labCell", for: indexPath) as! LabsCollectionViewCell
        
        if searchedHomeLabsArr.count > 0{
            
            cell.labImageVIew.sd_setImage(with: URL(string: searchedHomeLabsArr[indexPath.row].labPhoto ?? ""), placeholderImage:UIImage(named: "placeholder.png"))
            
            cell.labRating.rating =  (searchedHomeLabsArr[indexPath.row].rating as! NSString).doubleValue
            cell.labHotLine.text = searchedHomeLabsArr[indexPath.row].hotline
            
        }else{
            cell.labImageVIew.sd_setImage(with: URL(string: homeLabArr[indexPath.row].labPhoto ?? ""), placeholderImage:UIImage(named: "placeholder.png"))
            
            cell.labRating.rating =  (homeLabArr[indexPath.row].rating as! NSString).doubleValue
            cell.labHotLine.text = homeLabArr[indexPath.row].hotline
        }
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
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)  {
        
        if self.homeLabArr.count > 3 {
            if indexPath.row != 1 {
                if indexPath.row % 3 == 1 {
                    print("indexpath: \(indexPath.row)")
                    
                }
            }
        }
        
        
        
    }
    
    /*func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
     if indexPath.row == homeLabArr.count - 1 {  //numberofitem count
     print("reached")
     let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
     homeLabPresenter.getLabs(take: 1, skip: homeLabArr.count)
     }
     }*/
    
    /*func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
     if collectionView.bounds.maxY >= collectionView.contentSize.height && reach == false {
     
     print("reached")
     let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
     homeLabPresenter.getLabs(take: 1, skip: homeLabArr.count)
     reach = true
     
     } else if collectionView.bounds.maxY >= collectionView.contentSize.height && reach == true {
     
     reach = false
     }
     }*/
    
    func showSlider() {
        var slideShowImgs: [InputSource] = [InputSource]()
        if homeLabArr.count > 0{
            for i in homeLabArr {
                var x = SDWebImageSource(url: URL(string: i.labPhoto ?? "")!)
                slideShowImgs.append(x)
//                let ea = [SDWebImageSource(url: URL(string: i.labPhoto ?? "" )!)]

            }
        }
        if slideShowImgs.count > 0 {
            labSlideShow.setImageInputs(slideShowImgs)
        }
        
        
        labSlideShow.slideshowInterval = 3
        labSlideShow.contentScaleMode = .scaleToFill
        
        labSlideShow.delegate = self
        
        
        pageIndicator.currentPageIndicatorTintColor = UIColor.black
        pageIndicator.pageIndicatorTintColor = UIColor.black
        labSlideShow.pageIndicator = pageIndicator
        labSlideShow.activityIndicator = DefaultActivityIndicator()
    }
    
}
