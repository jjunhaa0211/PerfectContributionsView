<img width="1018" alt="logoimage" src="https://user-images.githubusercontent.com/102890390/200698254-9c66667c-062b-4827-a871-58ffb0192c79.png">


[![CI Status](https://img.shields.io/travis/102890390/PContributionsView.svg?style=flat)](https://travis-ci.org/102890390/PContributionsView)
[![Version](https://img.shields.io/cocoapods/v/PContributionsView.svg?style=flat)](https://cocoapods.org/pods/PContributionsView)
[![License](https://img.shields.io/cocoapods/l/PContributionsView.svg?style=flat)](https://cocoapods.org/pods/PContributionsView)
[![Platform](https://img.shields.io/cocoapods/p/PContributionsView.svg?style=flat)](https://cocoapods.org/pods/PContributionsView)

# PContributionsView


# Table of contents
* [Screenshots](#screenshots)
* [Installation](#installation)
* [Pre-knowledge](#pre-knowledge)
* [Support](#support)
* [Contact](#contact)

## <a id="screenshots"></a>Screenshots 

### iPhone

<img width="725" alt="스크린샷 2022-11-23 오후 1 33 30-2" src="https://user-images.githubusercontent.com/102890390/203470018-2e7f7f81-66af-4d7c-9648-b2a7dac44a9c.png">


# <a id="installation"></a>Installation

## CocoaPods:

* For iOS9+: 🌈

```ruby
use_frameworks!
target '<Your Target Name>' do
    pod 'PContributionsView'
end
```

## Carthage: 

Coming soon please wait 🙏

## SPM:

Coming soon please wait 🙏

# Setup

## Use Interface Builder

1、 Drag an UIView object to ViewController Scene<br/>
2、 Change the `Custom Class` to `PContributionsView`<br/>

<img width="1728" alt="스크린샷 2022-11-23 오후 1 40 08" src="https://user-images.githubusercontent.com/102890390/203470412-236b9e46-79ee-491f-bf07-907fae8e31c1.png">

## Or swift

* To use `FSCalendar` in swift, you need to [Create Bridge Header](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html) first.


```swift
var activityView: PContributionsView!
```
```swift
// In Class
let dataSquare = [ ]

var contributionView = PContributionsView()

// In loadView or viewDidLoad
contributionView.contrilbutionsData = dataSquare
view.addSubview(contributionView)
```

> To use **FSCalendar** in Swift3, see `Example-Swift` for details.


## <a id='adjusts_frame_dynamicly' /></a>Warning 
`FSCalendar` ***doesn't*** update frame by itself, Please implement

* For ***AutoLayout***

```objc
- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
{
    self.calendarHeightConstraint.constant = CGRectGetHeight(bounds);
    // Do other updates here
    [self.view layoutIfNeeded];
}
```

* For ***Manual Layout***

```objc
- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
{
    calendar.frame = (CGRect){calendar.frame.origin,bounds.size};
    // Do other updates here
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PContributionsView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PContributionsView'
```

## Author

jjunhaa0211, goodjunha@gmail.com

## License

PContributionsView is available under the MIT license. See the LICENSE file for more info.
