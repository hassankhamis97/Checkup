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
        
        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/GetGoverns").responseJSON { (response) in
            if let json = response.result.value{
                      print(json)
                
                do{
                    let reviewsObj = try JSONDecoder().decode(Review.self, from: response.data!)
                    print(reviewsObj)
                    print("api")
                //    print(filterLabObj.id)
          //          self.reviewsPresenter.onSuccess(reviewsObj: <#[Review]#>)
                    
                }catch let error{
                    print(error)

                }
            }
        }

    }
    
    
}



 
