//
//  StyleViewController.swift
//  Checkup
//
//  Created by Hassan Khamis on 6/1/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit

class StyleViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        var bounds = navigationBar.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
//        gradientLayer.colors = [#colorLiteral(red: 0, green: 0.5725490196, blue: 0.2705882353, alpha: 1).cgColor, UIColor(red: 131/255, green: 234/255, blue: 241/255, alpha: 1).cgColor]
//        gradient.colors = [UIColor(red: 131/255, green: 234/255, blue: 241/255, alpha: 1).cgColor, #colorLiteral(red: 0.3882352941, green: 0.6431372549, blue: 1, alpha: 1).cgColor]
        gradient.colors = [#colorLiteral(red: 0.01568627451, green: 0.3647058824, blue: 0.9137254902, alpha: 1).cgColor, #colorLiteral(red: 0.03529411765, green: 0.7411764706, blue: 0.9764705882, alpha: 1).cgColor]
//        gradient.colors = [#colorLiteral(red: 0.2705882353, green: 0.3607843137, blue: 0.9921568627, alpha: 1).cgColor, #colorLiteral(red: 0.1607843137, green: 0.5921568627, blue: 0.9529411765, alpha: 1).cgColor]
//        gradient.colors = [UIColor.init(red: 131, green: 234, blue: 241, alpha: 1), UIColor.init(red: 99, green: 164, blue: 255, alpha: 1)]
//        gradient.colors = [UIColor.blue.cgColor, UIColor.systemTeal.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)

        if let image = getImageFrom(gradientLayer: gradient) {
            navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        }
    }

    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
