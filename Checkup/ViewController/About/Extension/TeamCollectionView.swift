//
//  TeamCollectionView.swift
//  Checkup
//
//  Created by Hassan Khamis on 6/4/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension AboutTableViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamPicCell", for: indexPath) as! TeamImagesCollectionViewCell
        cell.teamImageView.sd_setImage(with: URL(string: teamArr[indexPath.row]), placeholderImage:UIImage(named: "placeholder.png"))
        cell.teamImageView.layer.cornerRadius=cell.teamImageView.frame.width / 2
        return cell
    }
    
    
}
