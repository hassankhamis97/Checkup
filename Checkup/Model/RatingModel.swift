//
//  RatingModel.swift
//  Checkup
//
//  Created by Aya on 6/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire

class RatingModel : IRatingModel{
   
func saveData(labReview : Review){

    let urlString = ""
    var reviewDictionary : Parameters = ["date" : labReview.date , "description" : labReview.description , "id" : labReview.id , "nickname" : labReview.nickname , "photoUrl" : labReview.photoUrl , "" : labReview.rateNumber , "userId" : labReview.userId ]
    
    Alamofire.request(urlString , method: .post , parameters: reviewDictionary , encoding: JSONEncoding.default ,headers: nil).responseJSON {
        response in
        switch response.result{
        case .success :
            print("success\(response)")
            break
        case .failure(let error):
            print(error)
        }
        
    }
}
}
