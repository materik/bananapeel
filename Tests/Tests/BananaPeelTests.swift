
import BananaPeel
import XCTest

class BananaPeelTests: XCTestCase {
    
    func testBlue() {
        Banana
            .launch(on: BlueBananaPeel.self)
            .assertSelectedTabBarTitle()
            .assertNavigationBarTitle()
            .peelOff()
    }
    
    func testTapOnRedTab() {
        Banana
            .launch(on: BlueBananaPeel.self)
            .assertSelectedTabBarTitle()
            .assertNavigationBarTitle()
            .tapOnRedTab()
            .assertSelectedTabBarTitle()
            .assertNavigationBarTitle()
            .peelOff()
    }
    
}
