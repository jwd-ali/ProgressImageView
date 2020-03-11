<img src="https://github.com/jwd-ali/TidalTestProject/blob/master/images/header/header.png">
<img align="right" src="https://github.com/jwd-ali/ProgressImageView/blob/master/images/img.gif" width="480" />
<p><h1 align="left">ProgressImageView</h1></p>

[![CI Status](https://travis-ci.org/jwd-ali/ProgressImageView.svg)](https://travis-ci.org/jwd-ali/ProgressImageView)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/ProgressImageView.svg?style=flat)](https://cocoapods.org/pods/ProgressImageView)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-0473B3.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/ProgressImageView.svg?style=flat)](https://cocoapods.org/pods/ProgressImageView)
[![Platform](https://img.shields.io/cocoapods/p/ProgessImageView.svg?style=flat)](https://cocoapods.org/pods/ProgressImageView)
[![Swift 5.1](https://img.shields.io/badge/swift-5.1-orange)](https://swift.org)

<p><h4>Progress image view to show progress around image animated</h4></p>

___

<p> 
  

<a href="https://www.linkedin.com/in/jawad-ali-3804ab24/"><img src="https://i.imgur.com/vGjsQPt.png" width="134" height="34"></a>  

</br></br>


## Requirements

- iOS 10.0+ / Mac OS X 10.9+ / watchOS 2.0+ / tvOS 9.0+
- Xcode 8.0+

## Installation

### [CocoaPods](http://cocoapods.org)

To integrate **ProgessImageView** into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'ProgessImageView'
```

Then, run the following command:

```bash
$ pod install
```

### [Carthage](http://github.com/Carthage/Carthage)

To integrate `ProgessImageView` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "jwd-ali/ProgessImageView"
```

### [Swift Package Manager (SPM)](https://swift.org/package-manager)

#### Prerequisites
- OSX


#### Update `Package.swift`
To integrate `ProgessImageView` in your project, add the proper description to your `Package.swift` file:
```swift
// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/jwd-ali/ProgessImageView.git", from: "1.0.2")
    ],
    targets: [
        .target(
            name: "YOUR_TARGET_NAME",
            dependencies: ["ProgessImageView"]
        ),
        ...
    ]
)
```

### Manually

If you prefer not to use a dependency manager, you can integrate ProgessImageView into your project manually.

- Add sources into your project:
  - Drag `ProgessImageView.swift`
  
## Usage

> If you are using any dependency manager (pods , carthage , package manager)to integrate ProgessImageView. Import ProgessImageView first:
> ```swift
> import ProgessImageView
> ```

> And for Manuall install you dont need to import anything 

- Init your ProgressView with  `image` and `color` of progress:
```swift
 let progressView = ProgessImageView(with: UIImage(named: "cup"), color: #colorLiteral(red: 0.4433879256, green: 0.2915558219, blue: 0.8948832154, alpha: 1), progress: 30 , animation: true)
 
```
Animation is False by default 
you can set frame or add constraints to chart 

```swift
 progressView.frame = CGRect(x: 50, y: 50, width: 150, height: 150)
 self.view .addSubview(progressView)
```
You can add chart line width by setting lineWidth property like this 
```swift
progressView.lineWidth = 7 
```

You can animate progress change any time from current value to the required value by setting progess value
```swift
progressView.progress = 70 
```
If you want to do anything on progresss completion you can do it through closure
```swift
progressView.animationDidFinish = {  print("Animation Completed")}
```

Congratulations! You're done.

## Contributing

I’d love to have help on this project. For small changes please [open a pull request](https://github.com/douglashill/KeyboardKit/pulls), for larger changes please [open an issue](https://github.com/douglashill/KeyboardKit/issues) first to discuss what you’d like to see.

License
-------

ProgessImageView is under [MIT](https://opensource.org/licenses/MIT). See [LICENSE](LICENSE) file for more info.
