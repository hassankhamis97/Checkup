//
//  PDFCollectionView.swift
//  Checkup
//
//  Created by Hassan Khamis on 5/27/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
extension ResultDetailsTableViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if testObj==nil {
            return 0
        }
        return testObj.resultFilespaths!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pdfCell", for: indexPath) as! ResultPDFCollectionViewCell
        cell.pdfNameLabel.text = "Result \(indexPath.row + 1)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pdfHistory = storyboard?.instantiateViewController(withIdentifier: "pdfHistory") as! PdfResultViewController
        pdfHistory.pdfUrl = testObj!.resultFilespaths![indexPath.row]
        navigationController?.pushViewController(pdfHistory, animated: true)
    }
    
}
