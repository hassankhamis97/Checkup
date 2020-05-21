//
//  ImagePresenter.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit

class ImagePresnter: IImagePresenter {
    
    var imageVieWRef:IImageView!
    
    
    init(imageViewRef:IImageView) {
        self.imageVieWRef = imageViewRef
    }
    
    func saveImage(img: UIImage?) {
      
       let imageModelRef=ImageModel(imagePresenterRef: self)
        imageModelRef.saveImage(img: img)
        
    }
    
    func onSuccess(url:String) {
        
        imageVieWRef.renderImage(url: url)
    }
    
    func onFail(message: String) {
        
    }
    
    
    
    
}
