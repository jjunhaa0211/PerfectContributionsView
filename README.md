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
 <img width="483" alt="스크린샷 2022-11-23 오후 1 33 30" src="https://user-images.githubusercontent.com/102890390/203469934-1e34e51f-ec56-477a-9083-9a266cf7500c.png">


# <a id="installation"></a>Installation

## CocoaPods:

* For iOS8+: 👍

```ruby
use_frameworks!
target '<Your Target Name>' do
    pod 'FSCalendar'
end
```

* For iOS7+:

```ruby
target '<Your Target Name>' do
	pod 'FSCalendar'
end
```

> [NSCalendarExtension](https://github.com/WenchaoD/NSCalendarExtension) is required to get iOS7 compatibility.

## Carthage: 
* For iOS8+

```ruby
github "WenchaoD/FSCalendar"
```

## SPM:

Add dependency:
```swift
.package(url: "https://github.com/WenchaoD/FSCalendar.git", from: "2.8.3")
```

## Manually:
* Drag all files under `FSCalendar` folder into your project. 👍

> Alternatively to give it a test run, simply press `command+u` in `Example-Objc` or `Example-Swift` and launch the ***UITest Target***. <br>
> Only the methods marked "👍" support IBInspectable / IBDesignable feature. [Have fun with Interface builder](#roll_with_interface_builder)


# Setup

## Use Interface Builder

1、 Drag an UIView object to ViewController Scene
2、 Change the `Custom Class` to `FSCalendar`<br/>
3、 Link `dataSource` and `delegate` to the ViewController <br/>

![fscalendar-ib](https://cloud.githubusercontent.com/assets/5186464/9488580/a360297e-4c0d-11e5-8548-ee9274e7c4af.jpg)

4、 Finally, implement `FSCalendarDataSource` and `FSCalendarDelegate` in your `ViewController`

## Or use code

```objc
@property (weak , nonatomic) FSCalendar *calendar;
```
```objc
// In loadView(Recommended) or viewDidLoad
FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
calendar.dataSource = self;
calendar.delegate = self;
[self.view addSubview:calendar];
self.calendar = calendar;
```
<br/>

## Or swift

* To use `FSCalendar` in swift, you need to [Create Bridge Header](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html) first.


```swift
fileprivate weak var calendar: FSCalendar!
```
```swift
// In loadView or viewDidLoad
let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
calendar.dataSource = self
calendar.delegate = self
view.addSubview(calendar)
self.calendar = calendar
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
