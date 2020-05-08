//
//  HistoryTableViewController.swift
//  Checkup
//
//  Created by Aya on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    
    var labNames = ["El-Mokhtabar" , "Alpha" , "El-Borg"]
    var labImages = ["mokhtabar" , "alpha" , "borg"]
    var labDate = ["21/2/2020" , "1/11/2019" , "5/9/2008"]
    
    var pdfHistory : PdfResultViewController!
    var searchPageObj : SearchViewController!
    var filterPage : FilterViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(addTapped))

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

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
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
    cell.labDateOutlet.text = labDate[indexPath.row]
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
          filterPage = storyboard?.instantiateViewController(identifier: "filter") as! FilterViewController
        } else {
            
        }
            navigationController?.pushViewController(filterPage, animated: true)
           
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
