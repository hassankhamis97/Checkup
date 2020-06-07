//
//  RatingContract.swift
//  Checkup
//
//  Created by Aya on 6/6/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation



    
    protocol IRatingView {
        
    }
    
    protocol IRatingPresenter {
        
        func getDataFromRatingModel(labReview : Review)
        func onSuccess()
        func onFail()
        
    }
    
    protocol IRatingModel {
        func saveData(labReview : Review)
    }
