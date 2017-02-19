
import XCTest

public protocol TablePeel {
    
    func assert(numberOfCells: UInt) -> Self
    
}

extension TablePeel where Self: BananaPeel {
    
    public func assert(numberOfCells: UInt) -> Self {
        return assert {
            let cells = $0.tables.cells
            XCTAssertEqual(cells.count, numberOfCells)
        }
    }
    
}
