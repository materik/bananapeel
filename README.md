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

## Usage

Read more about the general idea of the framework on my [blog](https://materik.tumblr.com/post/158923623366/contextual-uitesting-in-xcode).

Extend the `BananaPeel` class for every view in you app to create a unique
context for easier testing and maintainability.

```swift
extension LoginViewPeel: BananaPeel {

    override func viewDidAppear() -> Self {
        return self.assert {
            XCTAssertTrue(self.navigationBars["Login"].isVisible)
        }
    }

    func tapOnLoginButton() -> LoggedInViewPeel {
        return self.tap {
            $0.buttons["Login"]
        }
        .peel(on: LoggedInViewPeel.self)
    }

}

extension LoggedInViewPeel: BananaPeel {

    override func viewDidAppear() -> Self {
        return self.assert {
            XCTAssertTrue(self.navigationBars["Logged In"].isVisible)
        }
    }

    func tapOnLogoutButton() -> LoginViewPeel {
        return self.tap {
            $0.buttons["Logout"]
        }
        .peel(on: LoginViewPeel.self)
    }

}
```

Now you could write your tests like so:

```swift
func testLogin() {
    Banana()
        .addLaunchEnvironment(key: "isLoggedIn", value: "false")
        .peel(on: LoginViewPeel.self)
        .tapOnLoginButton()
        .peelOff()
}

func testLogout() {
    Banana()
        .addLaunchEnvironment(key: "isLoggedIn", value: "true")
        .peel(on: LoggedInViewPeel.self)
        .tapOnLogoutButton()
        .peelOff()
}
```

**Note** that you yourself have to handle the launch environment in your app to
put the user in the correct state. I have plans to extend this framework with 
helper classes for doing that.

## API

### Banana

```swift
init()

func addLaunchEnvironment(key: String, value: String) -> Self
func peel() -> BananaPeel
func peel<T: BananaPeel>(on peel: T.Type) -> BananaPeel
```

### BananaPeel

```swift
open func viewDidAppear() -> Self
open func viewDidDisappear() -> Self

func assert(closure: (XCUIApplication) -> ()) -> Self
func enter(text: String, into element: (XCUIApplication) -> (XCUIElement)) -> Self
func swipeDown(element: (XCUIApplication) -> (XCUIElement)) -> Self
func swipeLeft(element: (XCUIApplication) -> (XCUIElement)) -> Self
func swipeRight(element: (XCUIApplication) -> (XCUIElement)) -> Self
func swipeUp(element: (XCUIApplication) -> (XCUIElement)) -> Self
func tap(element: (XCUIApplication) -> (XCUIElement)) -> Self
func wait(_ time: UInt32 = 1) -> Self
func waitUntilVisible(timeout: TimeInterval = 5, element: (XCUIApplication) -> (XCUIElement)) -> Self
func waitUntilNotVisible(timeout: TimeInterval = 5, element: (XCUIApplication) -> (XCUIElement)) -> Self
func peel<T: BananaPeel>(on peel: T.Type) -> T
func peelOff()
```

