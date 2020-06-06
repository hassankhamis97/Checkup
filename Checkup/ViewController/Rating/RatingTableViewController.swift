//
//  RatingTableViewController.swift
//  Checkup
//
//  Created by Aya on 6/5/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class RatingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      //  tableView.backgroundView = UIImageView(image: UIImage(named: "newmicroscope (1)"))
        let imageView = UIImageView(image: UIImage(named:  "newmicroscope (1)"))
        imageView.alpha = 0.4
        self.tableView.backgroundView = imageView
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
           let cell = UITableViewCell()
                if(indexPath.row == 0){
                  let ratingCell = tableView.dequeueReusableCell(withIdentifier: "ratingCell", for: indexPath) as! RatingTableViewCell
                    
                    ratingCell.ratingView.layer.shadowPath =  UIBezierPath(rect: cell.bounds).cgPath
                    ratingCell.ratingView.layer.shadowRadius = 4
                    ratingCell.ratingView.layer.shadowOffset = .zero
                    ratingCell.ratingView.layer.shadowOpacity = 0.05
                    ratingCell.ratingView.layer.cornerRadius = 5
                    ratingCell.ratingView.layer.borderWidth = 5
                    ratingCell.ratingView.layer.borderColor = UIColor.white.cgColor
                    
                 return ratingCell
                 
             }else if(indexPath.row==1){
                let addNoteCell = tableView.dequeueReusableCell(withIdentifier: "addNoteCell", for: indexPath) as! NoteTableViewCell

                    
                    return addNoteCell
                 
             }else if(indexPath.row==2){
              let buttonCell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ButtonTableViewCell
                
               return buttonCell
             }
                         
               return cell

        

    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white : 1 , alpha: 0.5)
    }

    
}
