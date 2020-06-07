//
//  RatingTableViewController.swift
//  Checkup
//
//  Created by Aya on 6/5/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class RatingTableViewController: UITableViewController {

    @IBOutlet weak var commentOutlet: UITextView!
    @IBOutlet weak var ratingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

      //  tableView.backgroundView = UIImageView(image: UIImage(named: "newmicroscope (1)"))
        commentOutlet.layer.borderWidth = 0.5
        commentOutlet.layer.borderColor = UIColor.gray.cgColor
        let imageView = UIImageView(image: UIImage(named:  "newmicroscope (1)"))//
        imageView.alpha = 0.4
        self.tableView.backgroundView = imageView
        ratingView.layer.shadowPath =  UIBezierPath(rect:ratingView.bounds).cgPath
                          
                           ratingView.layer.shadowRadius = 10
                           ratingView.layer.shadowOffset = .zero
                           ratingView.layer.shadowOpacity = 0.1
                           ratingView.layer.cornerRadius = 10
                 //          ratingView.layer.borderWidth = 5
                   //       ratingView.layer.borderColor = UIColor.white.cgColor
        
        
        
        
        
         ratingView.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .extraLight)
           let blurView = UIVisualEffectView(effect: blurEffect)
           blurView.translatesAutoresizingMaskIntoConstraints = false
           ratingView.insertSubview(blurView, at: 0)
           NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: ratingView.heightAnchor) , blurView.widthAnchor.constraint(equalTo:ratingView.widthAnchor)])
        
    }

    // MARK: - Table view data source
    
/*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
           let cell = UITableViewCell()
                if(indexPath.row == 0){
                  let ratingCell = tableView.dequeueReusableCell(withIdentifier: "rating", for: indexPath) as! RatingTableViewCell

                    ratingCell.ratingView.layer.shadowPath =  UIBezierPath(rect: ratingCell.bounds).cgPath
                    ratingCell.ratingView.layer.shadowRadius = 4
                    ratingCell.ratingView.layer.shadowOffset = .zero
                    ratingCell.ratingView.layer.shadowOpacity = 0.05
                    ratingCell.ratingView.layer.cornerRadius = 5
                    ratingCell.ratingView.layer.borderWidth = 5
                    ratingCell.ratingView.layer.borderColor = UIColor.white.cgColor

                 return ratingCell

             }else
        if(indexPath.row==1){
                let addNoteCell = tableView.dequeueReusableCell(withIdentifier: "addNoteCell", for: indexPath) as! NoteTableViewCell

                    
                    return addNoteCell
                 
             }else {
              let buttonCell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ButtonTableViewCell
                
               return buttonCell
             }
                         
//               return cell

        

    }
    */
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white : 1 , alpha: 0.5)
    }

    
}
