![](logo.png)

[![](https://img.shields.io/badge/contact-@thematerik-blue.svg?style=flat-square)](http://twitter.com/thematerik)
[![](https://img.shields.io/cocoapods/v/BananaPeel.svg?style=flat-square)](https://cocoapods.org/pods/BananaPeel)
[![](https://img.shields.io/travis/materik/bananapeel.svg?style=flat-square)](https://travis-ci.org/materik/bananapeel)
![](https://img.shields.io/cocoapods/p/BananaPeel.svg?style=flat-square)
![](https://img.shields.io/cocoapods/l/BananaPeel.svg?style=flat-square)

Contextual XCode UI testing framework

## Install

```bash
pod 'BananaPeel'
```

## Example

```swift
func test() {
    Banana()
        .addLaunchEnvironment(key: "isTesting", value: "true")
        .peel()
        .assert {
            XCTAssertTrue($0.navigationBars["My App"].exists)
        }
        .tap {
            $0.tabBars.buttons["Tab 2"]
        }
        .assert {
            XCTAssertTrue($0.navigationBars["Settings"].exists)
        }
        .peelOff()
}
```

