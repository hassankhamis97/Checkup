//
//  FilterLabTableView.swift
//  Checkup
//
//  Created by Aya on 5/13/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class FilterLabTableView: UITableViewController , IFilterLabView {
    

        var sectionTitle : [String] = ["Governerates"]
        var sectionGovernerates : [String] = ["Alex" , "Cairo" , "Mansoura","Portsaid" , "Sharm"]

        var filterLabPresenter : IFilterLabPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterLabPresenter = FilterLabPresenter(view: self)
     
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return sectionGovernerates.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterLabCell", for: indexPath)

      
            cell.textLabel?.text = sectionGovernerates[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Governerates"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        print("aya")
         print(sectionGovernerates[indexPath.row])
        filterLabPresenter.getDataFromModel(govern: sectionGovernerates[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
    
    func returnDataToView(filterLabObjInView: FilterLab) {
        print("data returnedin view")
        print(filterLabObjInView.id!)
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
