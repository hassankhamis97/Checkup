//
//  ImageContract.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/18/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import Foundation
import UIKit
protocol IImageView  {
    func renderImage (url: String)
}
protocol IImagePresenter {
    func saveImage(img :UIImage?)
    func onSuccess(url: String)
    func onFail(message: String)
}
protocol IImageModel {
    func saveImage(img :UIImage?)
}
