
import XCTest

public protocol TableViewPeel {
    
    func assert(numberOfCells: UInt) -> Self
    
}

extension TableViewPeel where Self: BananaPeel {
    
    public func assert(numberOfCells: UInt) -> Self {
        return assert {
            let cells = $0.tables.cells
            XCTAssertEqual(cells.count, numberOfCells)
        }
    }
    
}
