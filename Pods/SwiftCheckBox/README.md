# SwiftCheckBox

![Logo](https://raw.githubusercontent.com/MagFer/SwiftCheckBox/master/Images/Checkbox.png)

[![CI Status](https://img.shields.io/travis/Ian Magarzo/SwiftCheckBox.svg?style=flat)](https://travis-ci.org/Ian Magarzo/SwiftCheckBox)
[![Version](https://img.shields.io/cocoapods/v/SwiftCheckBox.svg?style=flat)](https://cocoapods.org/pods/SwiftCheckBox)
[![License](https://img.shields.io/cocoapods/l/SwiftCheckBox.svg?style=flat)](https://cocoapods.org/pods/SwiftCheckBox)
[![Platform](https://img.shields.io/cocoapods/p/SwiftCheckBox.svg?style=flat)](https://cocoapods.org/pods/SwiftCheckBox)



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 8.0+ 
- Xcode 11+
- Swift 5.0+

## Installation

SwiftCheckBox is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftCheckBox'
```

## How to use

The checkbox button can be added programmatically 

```swift
import SwiftCheckBox

let button = CheckBoxButton(frame: CGRect(x: 100, y: 100, width: 80, height: 80))
let label = UILabel(frame: button.frame.applying(CGAffineTransform(translationX: 0, y: 30.0)))
button.selectedBlock = { label.text = $0 ? "selected" : "unselected" }
view.addSubview(button)
view.addSubview(label)
```

or via storyboard as a **custom button**

1. Add UIButton to the canvas
2. Change class to CheckBoxButton and Module to SwiftCheckBox

![UIButton subclass added](https://raw.githubusercontent.com/MagFer/SwiftCheckBox/master/Images/Storyboard1.png)

3. Navigate to atributes and change Type to Custom 

![UIButton type](https://raw.githubusercontent.com/MagFer/SwiftCheckBox/master/Images/Storyboard2.png)

## Author

Ian Magarzo, ian.magfer@gmail.com

## License

SwiftCheckBox is available under the MIT license. See the LICENSE file for more info.
