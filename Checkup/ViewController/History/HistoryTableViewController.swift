//
//  HistoryTableViewController.swift
//  Checkup
//
//  Created by Aya on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Firebase
class HistoryTableViewController: UITableViewController {

    var indx : Int!
    var myAlpha : Int!
    
    var labNames = ["El-Mokhtabar" , "Alpha","Alpha" ]
    var labImages = ["mokhtabar" , "alpha","alpha" ]
    var labDate = ["Apr 5, 2020","jun 1, 2020","May 14, 2020"]
    var dateDescingly : [HistoryObject]!
    var pdfHistory : PdfResultViewController!
    var filterPage : FilterTableViewController!
    
    
    override func viewWillAppear(_ animated: Bool) {
        if(Auth.auth().currentUser?.uid == nil)
        {
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginSVC") as! LoginTableViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)

        }else{
            self.tableView.reloadData()
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(addTapped))
        
           dateDescingly = formatDate(myArr: labDate)
    
    }
   

    // MARK: - Table view data source

    
   override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0
            UIView.animate(withDuration : 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                cell.alpha = 1
            })
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return labNames.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
    
    
    
    
    
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if #available(iOS 13.0, *) {
      pdfHistory = storyboard?.instantiateViewController(identifier: "pdfHistory") as! PdfResultViewController
    } else {
        
    }
        navigationController?.pushViewController(pdfHistory, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
      override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           self.tableView.sectionHeaderHeight = 70
           return "History"
       }
    
    @objc func addTapped(){
        if #available(iOS 13.0, *) {
          filterPage = storyboard?.instantiateViewController(identifier: "filter") as! FilterTableViewController
        } else {
            
        }
            navigationController?.pushViewController(filterPage, animated: true)
           
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
              
      

      
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
