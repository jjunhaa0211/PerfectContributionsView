<img width="1018" alt="logoimage" src="https://user-images.githubusercontent.com/102890390/200698254-9c66667c-062b-4827-a871-58ffb0192c79.png">


[![CI Status](https://img.shields.io/travis/102890390/PContributionsView.svg?style=flat)](https://travis-ci.org/102890390/PContributionsView)
[![Version](https://img.shields.io/cocoapods/v/PContributionsView.svg?style=flat)](https://cocoapods.org/pods/PContributionsView)
[![License](https://img.shields.io/cocoapods/l/PContributionsView.svg?style=flat)](https://cocoapods.org/pods/PContributionsView)
[![Platform](https://img.shields.io/cocoapods/p/PContributionsView.svg?style=flat)](https://cocoapods.org/pods/PContributionsView)

# Table of contents
* [Screenshots](#screenshots)
* [Installation](#installation)
* [Setup](#Setup)
* [Example](#Example)
* [Author](#Author)
* [Realization](#Realization)

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

# <a id="Setup"></a>Setup

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

# <a id="Example"></a>Example

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
### Change Cell Color

```swift
var activityView: PContributionsView!
```

```swift

// In loadView or viewDidLoad
      activityView.userCustomColor(ColorMap("#F4F4F4", "#72FFFF", "#00D7FF", "#0096FF", "#5800FF"))
```
defult Color is githubContributionsColor 🟩

### CellCornerRadius

```swift
var activityView: PContributionsView!
```

```swift
// In Class
    let dataSquare = [
        [-1, 0, -1, 0, -1],
        [0, -1, 0, -1, 0],
        [-1, 0, -1, 0, -1],
        [0, -1, 0, -1, 0],
        [-1, 0, -1, 0, -1],
        [0 ,-1 ,0, -1, 0]
    ]

// In loadView or viewDidLoad
      activityView.cellCornerRadius(10)
```
defult shape is square <br/>

⚠️ CellCornerRadius is not safe yet, please keep below 10 if possible ⚠️ (I'm sorry 😭)

### Color Level

```swift
// In Class
    let dataSquare = [
        [1, 2, -1, 4, -1],
        [1, -1, 2, 1, 0],
        [4, 2, -1, 0, -1],
        [0, 4, 0, 2, 1],
        [1, 0, -1, 0, -1],
        [4 ,-1 ,0, -1, 1]
    ]
```
| -1 | NULL         |
|----|--------------|
| 0  | very light   |
| 1  | little light |
| 2  | neutral      |
| 3  | bit darker   |
| 4  | very dark    |

<img width="188" alt="스크린샷 2022-11-23 오후 2 10 12" src="https://user-images.githubusercontent.com/102890390/203472943-4266ce16-140a-451e-a741-8543bb0bc337.png">

### ContributionsCell Spacing

```swift
var activityView: PContributionsView!
```

```swift
// In loadView or viewDidLoad
      activityView.spacing = 5
```
defult Spacing is "2"

### listBackgroud

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
    
    let dataSquare = [
        [-1, 0, -1, 0, -1],
        [0, -1, 0, -1, 0],
        [-1, 0, -1, 0, -1],
        [0, -1, 0, -1, 0],
        [-1, 0, -1, 0, -1],
        [0 ,-1 ,0, -1, 0]
    ]

// In loadView or viewDidLoad
      activityView.listBackground(.red)
      dataActivity.listBackground(.green)
```

What is the difference between listBackground and classic BackGround? <br/>
- listBackground is based on the created view, so if there are multiple views in one view, you can change the color of only the one you want.
- Existing background won't be a single selection

# <a id="Author"></a>Author

- 🐈‍⬛ Github = jjunhaa0211
- ✉️ Gmail = goodjunha@gmail.com
- 🌟 Dm = jn_xhx

# <a id="Realization"></a>Realization

- 🇺🇸 The library still has many bugs. I will correct it little by little. If you find any bugs, please contact me. Advice is always welcome 😆
- 🇰🇷 라이브러리에는 여전히 많은 버그가 있습니다. 조금씩 수정하겠습니다. 버그를 발견하면 저에게 연락하십시오. 조언은 언제나 환영합니다 🥹


## License

PContributionsView is available under the MIT license. See the LICENSE file for more info.
