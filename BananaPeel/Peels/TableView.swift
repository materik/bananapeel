
import XCTest

public protocol TableViewPeel {
    
    func assert(numberOfCells: UInt) -> Self
    
}

extension TableViewPeel where Self: BananaPeel {
    
    public func assert(numberOfCells: UInt) -> Self {
        return assert {
            print($0.debugDescription)
            XCTAssertEqual($0.tables.cells.count, numberOfCells)
        }
    }
    
}
