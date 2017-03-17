
import XCTest

public protocol NavigationBarPeel {
    
    func assert(navigationBarTitle title: String, timeout: TimeInterval) -> Self
    
}

extension NavigationBarPeel where Self: BananaPeel {
    
    public func assert(navigationBarTitle title: String,
                       timeout: TimeInterval = TimeInterval.timeout) -> Self {
        return self.waitUntilVisible(timeout: timeout) {
            $0.navigationBars[title]
        }
    }
    
}
