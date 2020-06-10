//
//  ReviewsModel.swift
//  Checkup
//
//  Created by Aya on 5/29/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire
import FirebaseFirestore
class ReviewsModel : IReviewsModel{
    
    let db = Firestore.firestore()
     var counter  = 0
    var reviewsObj : [Review]!
    var reviewsPresenter : IReviewsPresenter!
    init(presenter : IReviewsPresenter) {
        reviewsPresenter = presenter
    }
    
    
    func fetchReviews(reviewParam: ReviewsParams) {
     
        Alamofire.request("\(ApiUrl.API_URL)/api/AnalysisService/GetBranchReviews?branchId=\(reviewParam.branchId!)&take=\(reviewParam.take!)&skip=\(reviewParam.skip!)").responseJSON{ (response) in
            if let json = response.result.value{
                      print("reviews: \(json)")
                
                do{
                    self.reviewsObj = try JSONDecoder().decode(Array<Review>.self,from: response.data!)
                    print(self.reviewsObj)
                    print("reviews")
                  //  self.reviewsPresenter.onSuccess(reviewsObj: reviewsObj)
                    for review in self.reviewsObj{
                        self.readRestOfDataFromFirestore( count: self.reviewsObj.count, obj: review)
                    }
                    
                    
                }catch let error{
                    print(error)

                }
            }
        }

    }
    
    
  
    func readRestOfDataFromFirestore( count : Int , obj : Review){
      
            var myReviewObj = obj
        
        db.collection("users").document(myReviewObj.userId!).getDocument {(document  ,error) in
             
              print(document!)
              print(document?.data()?["nickname"] as? String?)
              
            myReviewObj.nickname = (document?.data()?["nickname"] as? String?)!
            myReviewObj.photoUrl = (document?.data()?["photoUrl"] as? String?)!
              
          
            self.counter = self.counter+1
              
 
            if (self.counter == count ){
                self.reviewsPresenter.onSuccess(reviewsObj: self.reviewsObj )
                print(self.reviewsObj!)
                for rev in self.reviewsObj{
                    print(rev.nickname)
                }
                  print("counter :  \(self.counter)")

              }
          }
          

      }
    

    
}



 
