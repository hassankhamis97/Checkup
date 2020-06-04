//
//  ReviewsContract.swift
//  Checkup
//
//  Created by Aya on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Foundation

 
 protocol IReviewsView{
    func returnDataToView(reviewsObj : [Review])
 }


 protocol IReviewsPresenter{
    func getReviewsDataFromModel(reviewParam : ReviewsParams)
    func onSuccess(reviewsObj : [Review])
    func onFail()
 }


 protocol IReviewsModel{
    func fetchReviews(reviewParam : ReviewsParams)
 }


