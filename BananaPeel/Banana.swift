
import XCTest

public class Banana {

    private var launchEnvironment: LaunchEnvironment = LaunchEnvironment()
    
    public init() {
        // Do nothing...
    }
    
    public func addLaunchEnvironment(key: String, value: String) -> Self {
        self.launchEnvironment.add(key: key, value: value)
        return self
    }
    
    public func peel() -> BananaPeel {
        return self.peel(on: BananaPeel.self)
    }
    
    public func peel<T: BananaPeel>(on peel: T.Type) -> T {
        let app = XCUIApplication()
        app.launchEnvironment = self.launchEnvironment.dictionary
        app.launch()
        
        print("BananaPeel: Launch (\(self.launchEnvironment.dictionary))")
        
        return T.init()
    }

}
