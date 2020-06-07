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

    let urlString = "http://www.checkup.somee.com/api/AnalysisService/AddReview"
    
     let reviewDictionary = try! DictionaryEncoder.encode(labReview)
    
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
