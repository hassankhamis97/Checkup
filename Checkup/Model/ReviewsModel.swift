//
//  ReviewsModel.swift
//  Checkup
//
//  Created by Aya on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire
class ReviewsModel : IReviewsModel{
    
    
    
    var reviewsPresenter : IReviewsPresenter!
    init(presenter : IReviewsPresenter) {
        reviewsPresenter = presenter
    }
    
      
    
    
    
    
    func fetchReviews() {
        
        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/GetBranchReviews?branchId=2&take=10&skip=0").responseJSON { (response) in
            if let json = response.result.value{
                      print("reviews: \(json)")
                
                do{
                    let reviewsObj = try JSONDecoder().decode(Array<Review>.self,from: response.data!)
                    print(reviewsObj)
                    print("reviews")
                  //  print(reviewsObj.date!)
                    self.reviewsPresenter.onSuccess(reviewsObj: reviewsObj)
                    
                }catch let error{
                    print(error)

                }
            }
        }

    }
    
    
}



 
