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

## Example

To run the example project, clone the repo, and run `arch -x86_64 pod install` from the Example directory first.

### Make Contributions Cell

```swift
var activityView: PContributionsView!
```

```swift
// In Class
    let dataActivity = [
        [-1, 1, 1, 1, 2, 1, 1, 1, 3, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1, 3],
        [-1, 2, 1, 1, 2, 2, 1, 1, 2, 1, 2, 1, 1, 1, 4, 2, 1, 2, 1, 3],
        [-1, 1, 1, 1, 2, 3, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 4],
        [-1, 3, 4, 2, 1, 3, 1, 4, 1, 2, 1, 3, 1, 1, 2, 2, 1, 2, 2, 4],
        [1, 2, 4, 3, 2, 3, 2, 3, 2, 1, 1, 2, 2, 1, 1, 2, 1, 1, 2],
        [2, 3, 3, 3, 1, 3, 2, 3, 4, 1, 3, 3, 3, 2, 1, 1, 1, 3, 3],
        [3, 1, 2, 2, 1, 3, 3, 2, 1, 1, 4, 2, 1, 1, 4, 4, 1, 2, 3]
    ]


    var contributionView = PContributionsView()

// In loadView or viewDidLoad
// Interface Builder
        activityView.contrilbutionsData = dataActivity
```
### Change Color

```swift
var activityView: PContributionsView!
```

```swift

// In loadView or viewDidLoad
      activityView.userCustomColor(ColorMap("#F4F4F4", "#72FFFF", "#00D7FF", "#0096FF", "#5800FF"))
```
//defult Color is githubContributionsColor 🟩


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
