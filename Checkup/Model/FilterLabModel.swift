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
    
    
    func fetchFilteredLab(){

        Alamofire.request("http://www.checkup.somee.com/api/AnalysisService/GetGoverns").responseJSON { (response) in
            if let json = response.result.value{
                      print(json)
                
                do{
                    let filterLabObj = try JSONDecoder().decode(Array<FilterGovern>.self, from: response.data!)
                    print(filterLabObj)
                    print("api")
                //    print(filterLabObj.id)
                self.filtreLabPresenterInModel.onSuccess(filteredData: filterLabObj)
                    
                }catch let error{
                    print(error)

                }
            }
        }


    }
    
    
}

