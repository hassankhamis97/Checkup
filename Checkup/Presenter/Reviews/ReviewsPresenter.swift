//
//  ReviewsPresenter.swift
//  Checkup
//
//  Created by Aya on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class ReviewsPresenter : IReviewsPresenter {
  
    
  
    var reviewsView : IReviewsView!
    var reviewsModel : IReviewsModel!
    
    init(view : IReviewsView) {
        reviewsView = view
    }
    
 
     func getReviewsDataFromModel(reviewParam: ReviewsParams) {
           reviewsModel = ReviewsModel(presenter:self)
        reviewsModel.fetchReviews(reviewParam: reviewParam)
       }
       
    
   
      func onSuccess(reviewsObj: [Review]) {
            reviewsView.returnDataToView(reviewsObj: reviewsObj)
       }
       
    
        
    func onFail() {
        
    }
    
    
}
