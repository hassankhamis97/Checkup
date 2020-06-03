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

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource, ImageSlideshowDelegate, IGetLabsView, IView {
    
    func getSearchedLabs(seachedHomeLabs: [HomeLab]) {
        
        self.searchedHomeLabsArr = seachedHomeLabs
        self.labCollection.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tap)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        view.addGestureRecognizer(tap)
        showIndicator()
        let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
        homeLabPresenter.getSearchedLabs(name: searchText)
    }
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
//    {
//        //Show Cancel
//        searchBar.setShowsCancelButton(true, animated: true)
//        searchBar.tintColor = .red
//    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //Hide Cancel
//        searchBar.setShowsCancelButton(false, animated: true)
//        view.addGestureRecognizer(tap)
        searchBar.resignFirstResponder()
    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
//    {
//        //Hide Cancel
//        searchBar.searchTextField.text = ""
//        searchBar.setShowsCancelButton(false, animated: true)
//        searchBar.text = String()
//        searchBar.resignFirstResponder()
//    }
    
    func getLabsForRender(homeLabs: [HomeLab]) {
        for i in homeLabs{
            self.homeLabArr.append(i)
        }
        if homeLabs.count > 0 {
            self.showSlider()
//            self.labCollection.reloadData()
        }
        
    }
    
    func showIndicator() {
        isLoading = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        labsActicity.show()
        labsActicity.startAnimating()
        labCollection.reloadData()
    }
    
    func hideIndicator() {
        isLoading = false
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        labsActicity.stopAnimating()
        labsActicity.hide()
        labCollection.reloadData()
    }
    
    func errorMessage(msg: String) {
        Alert.showSimpleAlert(title: "sorry", message: "No Internet Connection", viewRef: self)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchedHomeLabsArr.count > 0{
            return searchedHomeLabsArr.count
        }else if searchedHomeLabsArr.count <= 0 &&  searchBar.text?.count ?? 0 > 0 {
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
            
        } else if searchedHomeLabsArr.count <= 0 &&  searchBar.text?.count ?? 0 > 0{
            print("NoData")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noDataCell", for: indexPath)
            //noDataCell
            cell.sizeThatFits(CGSize(width: 500.0, height: 500.0))
            
            return cell
        } else{
//            if cellWidth != nil {
//                cell.bounds.size = cellWidth
//            }
            cell.labImageVIew.sd_setImage(with: URL(string: homeLabArr[indexPath.row].labPhoto ?? ""), placeholderImage:UIImage(named: "placeholder.png"))
            cell.labRating.rating =  (homeLabArr[indexPath.row].rating as! NSString).doubleValue
            cell.labRating.settings.updateOnTouch = false
            cell.labHotLine.text = homeLabArr[indexPath.row].hotline
        }
        cell.labImageVIew.layer.cornerRadius = 10
        //        cell.labRating.rating = 3
        
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.borderWidth = 5.0
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var senderLabId : String!
//        if searchedHomeLabsArr.count > 0{
//            return searchedHomeLabsArr.count
//        }else if searchedHomeLabsArr.count <= 0 &&  searchBar.text?.count ?? 0 > 0 {
//            return 1
//        } else {
//            return homeLabArr.count
//        }
        if (searchedHomeLabsArr.count > 0) {
            senderLabId = searchedHomeLabsArr[indexPath.row].idFB
            
        }
        else if  homeLabArr.count > 0 {
            senderLabId = homeLabArr[indexPath.row].idFB
        }
        
        if senderLabId != nil {
            var labDesc = storyboard?.instantiateViewController(withIdentifier: "labDescSCV")as! LabDescViewController
            labDesc.labId = senderLabId
            navigationController?.pushViewController(labDesc, animated: true)
        }
    }
    
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
//        var offsetYFixed = 0
        var newHeaderHeightFixed = CGFloat(0)
//        if ( contentOffsetY > 0){
//            var offsetYFixed = contentOffsetY
//        }
        if contentOffsetY >= (scrollView.contentSize.height - scrollView.bounds.height) - 20  && reach == false {
            showIndicator()
            print("reached")
            let homeLabPresenter = HomeLabPresenter(getLabsViewRef: self)
            homeLabPresenter.getLabs(take: 2, skip: homeLabArr.count)
            reach = true
        } else if contentOffsetY < (scrollView.contentSize.height - scrollView.bounds.height) - 20  && reach == true {
            
            reach = false
        }
//        let y : CGFloat = scrollView.contentOffset.y 276 - (-50)
                      let newHeaderHeight : CGFloat = headerViewHeight.constant-contentOffsetY    // 276 - 76 = 200
//        if newHeaderHeight !=  headerViewHeight.constant{
//            newHeaderHeightFixed = newHeaderHeight
//        }
                  if newHeaderHeight >= imageViewMaxHeight{ //200 >= 276
                          headerViewHeight.constant = imageViewMaxHeight
                            topViewConstraint.constant = topViewConstrainsMaxHeight
                      }else if newHeaderHeight < imageViewMinHeight{ //200 < 0
                          headerViewHeight.constant = imageViewMinHeight
                            topViewConstraint.constant = topViewConstrainsMinHeight
                      }else{
        //
//                    labImageView.alpha = 1 - (((imageViewMaxHeight - newHeaderHeight)*(0.9)) / (imageViewMaxHeight - imageViewMinHeight))
//                    labImageView.contentMode = .scaleAspectFill
                    if headerViewHeight.constant != newHeaderHeight {
                    topViewConstraint.constant =  topViewConstraint.constant -  (headerViewHeight.constant - newHeaderHeight)  // topViewConstrainsMaxHeight - offsetYFixed    -71
                    }
                          headerViewHeight.constant = newHeaderHeight   //200
                    
                          scrollView.contentOffset.y = 0
                      }
//        let currentCell = tableView.cellForRow(at: 1) as! SmallDescLabTableViewCell
//        let indexPath = IndexPath(row: 1, section: 1)
//            let cell = tableView.cellForRow(at: indexPath)
//        var cellWidth = sliderShowCell?.bounds.width
//        var cellHeight = sliderShowCell?.bounds.height
//        sliderShowCell?.bounds.size = CGSize(width: cellWidth!, height: 0)
//        labCollectionCell?.bounds.size = CGSize(width: cellWidth!, height: (labCollectionCell?.bounds.height)! + cellHeight!*2)
//        let y : CGFloat = scrollView.contentOffset.y
//                      let newHeaderHeight : CGFloat = headerViewHeight.constant-y
//
//                  if newHeaderHeight >= imageViewMaxHeight{
//                          headerViewHeight.constant = imageViewMaxHeight
//                      }else if newHeaderHeight < imageViewMinHeight{
//                          headerViewHeight.constant = imageViewMinHeight
//
//                      }else{
//
//                      }

    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        var cell = tableView.cellForRow(at: indexPath)
//        var cellHeight = cell?.layer.frame.height
//        if indexPath.row == 1 {
//            return 0
//        }
//        return cellHeight!
//    }

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
            for i in 0..<homeLabArr.count {
                slideShowImgs.append(SDWebImageSource(url: URL(string: homeLabArr[i].labPhoto ?? "")!))
                if (i == 2) {
                    break
                }
            }
        }
        if slideShowImgs.count > 0 {
            labSlideShow.setImageInputs(slideShowImgs)
        }
        
        
        labSlideShow.slideshowInterval = 3
        labSlideShow.contentScaleMode = .scaleToFill
        
        labSlideShow.delegate = self
        
        
        pageIndicator.currentPageIndicatorTintColor = UIColor.gray
        pageIndicator.pageIndicatorTintColor = UIColor.white
        labSlideShow.pageIndicator = pageIndicator
        labSlideShow.activityIndicator = DefaultActivityIndicator()
    }
    
}
