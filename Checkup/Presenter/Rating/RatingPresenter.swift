//
//  RatingPresenter.swift
//  Checkup
//
//  Created by Aya on 6/7/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
class RatingPresenter : IRatingPresenter {

    
 
    
    var ratingView : IRatingView!
    var ratingModel : IRatingModel!
    
    init(view : IRatingView){
        
        ratingView = view
        
    }
    
    
    func passDataToModel(labReview: Review) {
        ratingModel = RatingModel()
        ratingModel.saveData(labReview: labReview)
    }
    
    func onSuccess() {
        
    }
    
    func onFail() {
        
    }
}
