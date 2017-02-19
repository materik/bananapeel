
import XCTest

public protocol TabBarPeel {
    
    func tap<T: BananaPeel>(onTab title: String, peel: T.Type) -> T
    func assert(selectedTabBarTitle title: String) -> Self
    
}

extension TabBarPeel where Self: BananaPeel {
    
    public func tap<T: BananaPeel>(onTab title: String, peel: T.Type) -> T {
        return self.tap {
            $0.tabBars.buttons[title]
        }
        .peel(on: peel)
    }
    
    public func assert(selectedTabBarTitle title: String) -> Self {
        return self.assert {
            XCTAssertTrue($0.tabBars.buttons[title].isSelected)
        }
    }
    
}
