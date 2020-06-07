//
//  FilterLabTableView.swift
//  Checkup
//
//  Created by Aya on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class FilterLabTableView: UITableViewController , IFilterLabView {
  
    

//        var sectionTitle : [String] = ["Governerates"]
//        var sectionGovernerates : [String] = ["Alex" , "Cairo" , "Mansoura","Portsaid" , "Sharm"]

        var filterLabPresenter : IFilterLabPresenter!
        var filteredArr : [FilterGovern]!
        var myFilterProtocol : FilterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       filterLabPresenter = FilterLabPresenter(view: self)
       filterLabPresenter.getDataFromModel()
    
        
    }
   

    func returnDataToView(filterLabArrInView: [FilterGovern]) {
        filteredArr = filterLabArrInView
        print("data returned in view")
        print(filteredArr.count)
        tableView.reloadData()
      }
      

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if(filteredArr == nil){
            return 0
        }else{
            return filteredArr!.count
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterLabCell", for: indexPath)
        
        cell.textLabel!.text = filteredArr[indexPath.row].name!
        print(filteredArr[indexPath.row].name!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Governerates"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.myFilterProtocol?.passingDataFromFilterToDesc(governId: filteredArr[indexPath.row].id!)
        self.navigationController?.popViewController(animated: true)
    }
    

      
    

}
