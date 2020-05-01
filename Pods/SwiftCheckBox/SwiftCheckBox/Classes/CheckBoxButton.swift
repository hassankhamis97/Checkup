//
//  CheckBoxButton.swift
//  SwiftCheckBox
//
//  Created by Ian-Andoni Magarzo Fernandez on 25/03/2020.
//

import UIKit

public class CheckBoxButton: UIButton {
    
    public var selectedBlock: ((Bool)->())?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard buttonType == .custom else {
            fatalError("Requires to set [Type: Custom] from the storyBoard")
        }
        commonInit()
    }
    
    private func commonInit() {
        
        let appBundle = Bundle(for: Self.self)
        let assetsBundleURL = appBundle.bundleURL.appendingPathComponent("SwiftCheckBoxImgs.bundle")
        guard let assetsBundle = Bundle(url: assetsBundleURL) else {
            fatalError("nil bundle")
        }
        
        let unckeckedImg = UIImage(named: "unchecked_checkbox", in: assetsBundle, compatibleWith: nil)
        setImage(unckeckedImg, for: .normal)
        setTitle("", for: .normal)
         
        let checkedImg = UIImage(podAssetName: "checked_checkbox")
        setImage(checkedImg, for: .selected)
        setTitle("", for: .selected)
        
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc private func touchUpInside() {
        self.isSelected = !self.isSelected
        selectedBlock?(self.isSelected)
    }

}

//https://github.com/CocoaPods/CocoaPods/issues/1892
extension UIImage {
    
   convenience init?(podAssetName: String) {
       let podBundle = Bundle(for: CheckBoxButton.self)
      
       /// A given class within your Pod framework
       guard let url = podBundle.url(forResource: "SwiftCheckBoxImgs",
                                     withExtension: "bundle") else {
           return nil
                                       
       }

       self.init(named: podAssetName,
                 in: Bundle(url: url),
                 compatibleWith: nil)
   }
    
}
