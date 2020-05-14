//
//  UsersTableViewController.swift
//  Checkup
//
//  Created by azab on 5/14/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var users : [UserNeedToTakeSample] = [UserNeedToTakeSample]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user : UserNeedToTakeSample = UserNeedToTakeSample(name: "Ali", imageURL: "https://mobresults.almokhtabar.com:88/UploadedImages/aacd8efc-6096-4230-ab87-5140e90c5e45.jpg", age: 12, address: "Cairo", phones: ["5166515", "5115545"], date: "jun 01 4895", time: "12:45 PM")
        
        tableView.register(UINib(nibName: "UserCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "userCustomCell")
        
        users.append(user)
        users.append(user)
        users.append(user)
        users.append(user)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCustomCell", for: indexPath) as! UserCustomTableViewCell
        
        cell.userImg.sd_setImage(with: URL(string: users[indexPath.row].imageURL), placeholderImage:UIImage(named: "placeholder.png"))
        cell.userName.text = users[indexPath.row].name
        cell.userAddress.text = users[indexPath.row].address
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let userDataSB = storyboard?.instantiateViewController(withIdentifier: "userDataSB") as? UserDataTableViewController else { return }
        
        userDataSB.patientData = users[indexPath.row]
        navigationController?.pushViewController(userDataSB, animated: true)
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
