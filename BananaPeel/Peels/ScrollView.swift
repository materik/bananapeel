
import XCTest

public protocol ScrollViewPeel {
    
    func scrollLeft() -> Self
    func scrollRight() -> Self
    
}

extension ScrollViewPeel where Self: BananaPeel {
    
    public func scrollLeft() -> Self {
        return swipeRight {
            $0.scrollViews.element
        }
    }
    
    public func scrollRight() -> Self {
        return swipeLeft {
            $0.scrollViews.element
        }
    }
    
}
