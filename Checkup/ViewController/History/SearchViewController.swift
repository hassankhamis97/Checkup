//
//  SearchViewController.swift
//  Checkup
//
//  Created by Aya on 5/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
	
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    struct Labs {
        var name : String!
        var image : String!
        var date : String!
    }
    
    var lab1 :  Labs = Labs(name: "El-Mokhtabar" , image: "mokhtabar", date: "21/2/2020" )
    var lab2 : Labs = Labs(name:  "Alpha", image: "alpha" , date: "1/11/2019")
    var lab3 : Labs = Labs(name: "El-Borg", image: "borg" , date: "5/9/2008")
    var lab4 : Labs = Labs(name: "El-Mokhtabar" , image: "mokhtabar", date: "27/8/2015" )
    
    var labObj = [Labs]()
    
    
  /*  var labsObj = [ Labs(name: "El-Mokhtabar" , image: "mokhtabar", date: "21/2/2020" ),
                    Labs(name:  "Alpha", image: "alpha" , date: "1/11/2019"),
                    Labs(name: "El-Borg", image: "borg" , date: "5/9/2008") ,
                    Labs(name: "El-Mokhtabar" , image: "mokhtabar", date: "27/8/2015" )]
    */
    
    
    
   /* var labNames = ["El-Mokhtabar" , "Alpha" , "El-Borg" , "El-Mokhtabar"]
    var labImages = ["mokhtabar" , "alpha" , "borg" , "mokhtabar"]
    var labDate = ["21/2/2020" , "1/11/2019" , "5/9/2008" , "27/8/2015"]
   */
    var searchedLabName : [Labs] = []
    var searchingMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labObj.append(lab1)
        labObj.append(lab2)
         labObj.append(lab3)
         labObj.append(lab4)
        

    }
    

}

extension SearchViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        if searchingMode{
             return searchedLabName.count
        }else{
        return labObj.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell
      
        if searchingMode{
            cell.labNameOutlet.text = searchedLabName[indexPath.row].name
            

        }else{
            cell.labNameOutlet.text = labObj[indexPath.row].name
        }
        
        cell.labImage.image = UIImage(named:labObj[indexPath.row].image)
        cell.labImage.layer.cornerRadius = cell.labImage.frame.height/2

        
        cell.layer.cornerRadius = 10
               cell.layer.borderWidth = 2
               cell.layer.borderColor = UIColor.white.cgColor
               cell.translatesAutoresizingMaskIntoConstraints = false
             
        return cell
    }
}
extension SearchViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
    //    searchedLabName =  labObj.filter({$0.prefix(searchText.count) == searchText})
                 
       
        
     searchedLabName = labObj.filter { (obj : Labs) -> Bool in
            
        return obj.name.lowercased().contains(searchText.lowercased())
        }
        
        searchingMode = true
        tableView.reloadData()
            
    }
   
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchingMode = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
