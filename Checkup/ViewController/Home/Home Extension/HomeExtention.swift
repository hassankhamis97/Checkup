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

extension HomeTableViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ImageSlideshowDelegate, IGetLabsView,  UISearchBarDelegate, IView {
    
    func getSearchedLabs(seachedHomeLabs: [HomeLab]) {
        
        self.searchedHomeLabsArr = seachedHomeLabs
        self.labCollection.reloadData()
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
        homeLabPresenter.getSearchedLabs(name: searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        //Show Cancel
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.tintColor = .white
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //Hide Cancel
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        //Hide Cancel
        searchBar.searchTextField.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = String()
        searchBar.resignFirstResponder()
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
        Alert.showSimpleAlert(title: "Sorry", message: "No Internet Connection", viewRef: self)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchedHomeLabsArr.count > 0{
            return searchedHomeLabsArr.count
        }else if searchedHomeLabsArr.count <= 0 &&  searchController.searchBar.text?.count ?? 0 > 0 {
            return 1
        } else {
            return homeLabArr.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labCell", for: indexPath) as! LabsCollectionViewCell
        
        if searchedHomeLabsArr.count > 0{
            
            cell.labImageVIew.sd_setImage(with: URL(string: searchedHomeLabsArr[indexPath.row].labPhoto ?? ""), placeholderImage:UIImage(named: "placeholder.png"))
            
            cell.labRating.rating =  (searchedHomeLabsArr[indexPath.row].rating as! NSString).doubleValue
            cell.labRating.settings.updateOnTouch = false
            cell.labHotLine.text = searchedHomeLabsArr[indexPath.row].hotline
            
        } else if searchedHomeLabsArr.count <= 0 &&  searchController.searchBar.text?.count ?? 0 > 0 {
            print("NoData")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noDataCell", for: indexPath)
            //noDataCell
            cell.sizeThatFits(CGSize(width: 500.0, height: 500.0))
            return cell
        } else{
            cell.labImageVIew.sd_setImage(with: URL(string: homeLabArr[indexPath.row].labPhoto ?? ""), placeholderImage:UIImage(named: "placeholder.png"))
            cell.labRating.rating =  (homeLabArr[indexPath.row].rating as! NSString).doubleValue
            cell.labRating.settings.updateOnTouch = false
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
    
    
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        if contentOffsetY >= (scrollView.contentSize.height - scrollView.bounds.height) - 20  && reach == false {
            
            print("reached")
            let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
            homeLabPresenter.getLabs(take: 1, skip: homeLabArr.count)
            reach = true
        } else if contentOffsetY < (scrollView.contentSize.height - scrollView.bounds.height) - 20  && reach == true {
            
            reach = false
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
     if (indexPath.row == homeLabArr.count - 1 ) { //it's your last cell
     //Load more data & reload your collection view
     print("reached")
     let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
     homeLabPresenter.getLabs(take: 3, skip: homeLabArr.count)
     }
     }*/
    
    /*func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //-   labCollection.frame.size.height
        if labCollection.bounds.maxY >= labCollection.contentSize.height && reach == false {
            
            print("reached")
            let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
            homeLabPresenter.getLabs(take: 1, skip: homeLabArr.count)
            reach = true
            
        } else if labCollection.bounds.maxY < labCollection.contentSize.height && reach == true {
            
            reach = false
        }
    }*/
    
    func showSlider() {
        var slideShowImgs: [InputSource] = [InputSource]()
        if homeLabArr.count > 0{
            for i in homeLabArr {
                slideShowImgs.append(SDWebImageSource(url: URL(string: i.labPhoto ?? "")!))
                
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
