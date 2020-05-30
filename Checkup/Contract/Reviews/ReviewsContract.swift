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
    func returnDataToView()
 }


 protocol IReviewsPresenter{
    func getReviewsDataFromModel()
    func onSuccess()
    func onFail()
 }


 protocol IReviewsModel{
    func fetchReviews()
 }


