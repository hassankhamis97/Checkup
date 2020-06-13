//
//  ContactsTableViewController.swift
//  Checkup
//
//  Created by Aya on 6/11/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class ContactsTableView: UITableView {


    func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return 3
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
   //        cell.phoneNumberTxt.text = "011"

           // Configure the cell...

           return cell
       }

    

}
