
import XCTest

public class Banana {

    public static func launch() -> BananaPeel {
        let app = XCUIApplication()
        app.launch()
        return BananaPeel(app: app)
    }
    
    public static func launch<T: BananaPeel>(on peel: T.Type) -> T {
        let app = XCUIApplication()
        app.launch()
        return T.init(app: app)
    }

}
