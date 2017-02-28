
import BananaPeel
import XCTest

class BananaPeelTests: XCTestCase {
    
    func testBlue() {
        Banana()
            .peel(on: BlueBananaPeel.self)
            .assertSelectedTabBarTitle()
            .assertNavigationBarTitle()
            .peelOff()
    }
    
    func testTapOnRedTab() {
        Banana()
            .peel(on: BlueBananaPeel.self)
            .assertSelectedTabBarTitle()
            .assertNavigationBarTitle()
            .tapOnRedTab()
            .assertSelectedTabBarTitle()
            .assertNavigationBarTitle()
            .peelOff()
    }
    
}
