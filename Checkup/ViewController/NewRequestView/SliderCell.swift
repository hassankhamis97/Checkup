//
//  SliderCell.swift
//  Checkup
//
//  Created by yasmin mohsen on 4/30/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
  
    @IBOutlet weak var deleteBtn: UIButton!
     var btnTapAction : (()->())?
    
    @IBOutlet weak var testCell: UILabel!
    var label:UILabel!{
        didSet{
            testCell.text=label.text
            
        }
    }
  
    
    override func awakeFromNib() {
        setUp()
    }
    
    
    
    func setUp(){
        
        
        layer.cornerRadius=8
        layer.borderColor=UIColor.white.cgColor
        
    }
    
//    override init(frame: CGRect){
//        super.init(frame: frame)
//        setupViews()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func setupViews(){
//
//deleteBtn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
//
//        }
//
//    @objc func btnTapped() {
//        print("Tapped!")
//
//        // use our "call back" action to tell the controller the button was tapped
//        btnTapAction?()
//    }
    }
    

