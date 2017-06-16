# AAShimmerView

[![CI Status](http://img.shields.io/travis/ahmed93/AAShimmerView.svg?style=flat)](https://travis-ci.org/ahmed93/AAShimmerView)
[![Version](https://img.shields.io/cocoapods/v/AAShimmerView.svg?style=flat)](http://cocoapods.org/pods/AAShimmerView)
[![License](https://img.shields.io/cocoapods/l/AAShimmerView.svg?style=flat)](http://cocoapods.org/pods/AAShimmerView)
[![Platform](https://img.shields.io/cocoapods/p/AAShimmerView.svg?style=flat)](http://cocoapods.org/pods/AAShimmerView)

## Demo

<img width="400" height="800" src="https://raw.githubusercontent.com/ahmed93/aashimmerview/master/Demo.gif">

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Xcode 8.0+
* Swift 3.0

## Installation

AAShimmerView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AAShimmerView"
```

## Usage

First thing to do is to import AAShimmerView

```swift
import AAShimmerView
```

Then just do what ever you want

```swift
label1.aaShimmerHeight = label1.frame.height/2
label2.aaShimmerHeight = label2.frame.height/2
label3.aaShimmerHeight = label3.frame.height/2
label4.aaShimmerHeight = label4.frame.height/2

containerView.aaShimmerSubViews = [label1, label2, label3, label4, imageView]
containerView.startShimmering()
```

# Contributing

Issues and pull requests are welcome!

## Author

Ahmed Mohamed Magdi, ahmed.moh.magdi93@gmail.com

## License

AAShimmerView is available under the MIT license. See the LICENSE file for more info.
