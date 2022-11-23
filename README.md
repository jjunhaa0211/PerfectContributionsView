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
![fscalendar](https://cloud.githubusercontent.com/assets/5186464/10262249/4fabae40-69f2-11e5-97ab-afbacd0a3da2.jpg)

### iPad
![fscalendar-ipad](https://cloud.githubusercontent.com/assets/5186464/10927681/d2448cb6-82dc-11e5-9d11-f664a06698a7.jpg)

### Safe Orientation
![fscalendar-scope-orientation-autolayout](https://cloud.githubusercontent.com/assets/5186464/20325758/ea125e1e-abc0-11e6-9e29-491acbcb0d07.gif)

### Today Extension
|    iOS8/9    |    iOS10    |
|--------------|-------------|
|![today1](https://cloud.githubusercontent.com/assets/5186464/20288375/ed3fba0e-ab0d-11e6-8b15-43d3dc656f22.gif)|![today2](https://cloud.githubusercontent.com/assets/5186464/20288378/f11e318c-ab0d-11e6-8d1d-9d89b563e9d7.gif)|

### Interactive Scope Gesture
| ![1](https://cloud.githubusercontent.com/assets/5186464/21559640/e92a9ccc-ce8a-11e6-8c60-e52204f33249.gif) |
| ---- |

### DIY support
|  ![1](https://cloud.githubusercontent.com/assets/5186464/20026983/22354a0e-a342-11e6-8ae6-0614ea7f35ae.gif)    |
| -------------  |
> To customize your own cell, view DIY Example in `Example-Swift` or `Example-Objc`


### Swipe-To-Choose

|Single-Selection<br/>Swipe-To-Choose|Multiple-Selection<br/>Swipe-To-Choose|DIY<br/>Swipe-To-Choose|
|----------|--------|--------|
|![1](https://cloud.githubusercontent.com/assets/5186464/20257768/cb1905d4-aa86-11e6-9ef7-af76f9caa024.gif)|![2](https://cloud.githubusercontent.com/assets/5186464/20257826/254070ec-aa87-11e6-81b1-1815453fd464.gif)|![3](https://cloud.githubusercontent.com/assets/5186464/20257836/2ffa3252-aa87-11e6-8ff9-3b40f5b2307b.gif)|

## Achievement of Users <a id="achievement"></a>

|  ![1](https://cloud.githubusercontent.com/assets/5186464/21747193/3111e4ee-d59a-11e6-8e4d-ca695b53e421.png)    |  ![2](https://cloud.githubusercontent.com/assets/5186464/21747393/42a753fa-d5a0-11e6-9cb2-de7cc642e69e.png)  |  ![3](https://cloud.githubusercontent.com/assets/5186464/21897255/ff78fcdc-d923-11e6-9d59-62119bc4343f.png)  |  ![4](https://cloud.githubusercontent.com/assets/5186464/21747192/3111cacc-d59a-11e6-8626-44cd75ebd794.png)  |
| ------------- | ------------- | ------------- | ------------- |

#### [***More Achievements***](https://github.com/WenchaoD/FSCalendar/wiki/) are available in [***FSCalendar Gallery***](https://github.com/WenchaoD/FSCalendar/wiki/)  

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
