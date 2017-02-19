
import XCTest

public protocol NavigationBarPeel {
    
    func assert(navigationBarTitle title: String) -> Self
    
}

extension NavigationBarPeel where Self: BananaPeel {
    
    public func assert(navigationBarTitle title: String) -> Self {
        return self.assert {
            XCTAssertTrue(
                $0.navigationBars[title].exists,
                "\(String(describing: type(of: self))): Navigation bar title isn't \(title)"
            )
        }
    }
    
}
