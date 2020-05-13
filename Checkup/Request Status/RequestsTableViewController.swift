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
    var labDate = ["Apr 5,2020","june 1,2020","May 14,2020"]
    var dateDescingly : [String]!
    
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
          cell.labDateOutlet.text = dateDescingly[indexPath.row]
      
        return cell
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 100
        
      }
      func formatDate(myArr : [String]) -> [String] {
             var convertedArray : [String] = []
             var dateForrmatter = DateFormatter()
             dateForrmatter.dateFormat = "MMMM d,yyyy"
             
             for myDate in myArr{
                 let date = dateForrmatter.date(from: myDate)
                 if let date = date{
                     var newDate = dateForrmatter.string(from: date)
                     convertedArray.append(newDate)
                 }
             }
             print(convertedArray)
             
             var dateDescindingly = convertedArray.sorted(by : {$0.compare($1) == .orderedDescending})
             print("desc")
             print(dateDescindingly)
             

             return dateDescindingly
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
