//
//  FilterLabModel.swift
//  Checkup
//
//  Created by Aya on 5/26/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import Alamofire
class FilterLabModel : IFilterLabModel{
     
    var filtreLabPresenterInModel : IFilterLabPresenter!
    
    init(presenter : IFilterLabPresenter) {
        filtreLabPresenterInModel = presenter
    }
    
    
    func fetchFilteredLab(govern: String){

        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/GetGoverns").responseJSON { (response) in
            if let json = response.result.value{
                      print(json)
                
                do{
                    let filterLabObj = try JSONDecoder().decode(FilterLab.self, from: response.data!)
                    print(filterLabObj)
                    self.filtreLabPresenterInModel.onSuccess(filteredDara: filterLabObj)
                    
                }catch let error{
                    print(error)

                }
            }
        }


    }
    
    
}
/*
 do{
               let brachDescObj = try JSONDecoder().decode(BranchDescription.self , from: response.data!)
           
               print(brachDescObj)
               print("aya")
               self.newBranchPresenter.onSuccess(branchDescObj: brachDescObj)
           }catch let error{
           }
 */
