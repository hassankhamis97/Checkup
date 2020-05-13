//
//  RequestsTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class RequestsTableViewController: UITableViewController {
    
    var labNames = ["El-Mokhtabar" , "Alpha","Alpha" ]
    var labImages = ["mokhtabar" , "alpha","alpha" ]
    var labDate = ["Apr 5, 2020","jun 1, 2020","May 14, 2020"]
    var dateDescingly : [HistoryObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateDescingly = formatDate(myArr: labDate)
        //        dateDescingly=labDate
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return labNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        
        
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        cell.labImageOutlet.image = UIImage(named: labImages[indexPath.row])
        cell.labImageOutlet.layer.cornerRadius = cell.labImageOutlet.frame.height/2
        
        cell.labNameOutlet.text = self.labNames[indexPath.row]
        cell.labDateOutlet.text = dateDescingly[indexPath.row].dateString
        
        cell.labDateOutlet.sizeToFit()
        cell.labNameOutlet.sizeToFit()
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    func formatDate(myArr : [String]) -> [HistoryObject] {
        var convertedArray : [String] = []
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"// yyyy-MM-dd"
        
        
        let historyArray: [HistoryObject] = myArr.map {
            let value = Int(arc4random_uniform(1000))
            return HistoryObject(dateString: $0, value: value)
        }
        
        print("\n-----> Before sorting <-----")
        historyArray.forEach { print($0) }
        
        //Create an array of the `Dates` for each HistoryObject
        let historyDates: [Date] = historyArray.map { dateFormatter.date(from: $0.dateString)!
        }
        
        //Combine the array of `Dates` and the array of `HistoryObjects` into an array of tuples
        let historyTuples = zip(historyArray, historyDates)
        
        //Sort the array of tuples and then map back to an array of type [HistoryObject]
        let sortedHistoryObjects = historyTuples.sorted { $0.1 > $1.1}
            .map {$0.0}
        
        print("\n-----> After sorting <-----")
        sortedHistoryObjects.forEach { print($0) }
        
        return sortedHistoryObjects
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "reqStatus") as! RequestStatusTableViewController
            navigationController?.pushViewController(vc, animated: true)
        } else {
            
        }
        
    }
    
}


