
import XCTest

open class BananaPeel {
    
    public typealias VoidClosure = (XCUIApplication) -> ()
    public typealias ElementClosure = (XCUIApplication) -> (XCUIElement)
    
    internal var app: XCUIApplication
    
    public required init(app: XCUIApplication) {
        self.app = app
    }
    
    public func enter(text: String, into element: ElementClosure) -> Self {
        tap(element: element).peelOff()
        element(self.app).typeText(text)
        return self
    }
    
    public func tap(element: ElementClosure) -> Self {
        element(self.app).tap()
        return self
    }
    
    public func assert(closure: VoidClosure) -> Self {
        closure(self.app)
        return self
    }
    
    public func peel<T: BananaPeel>(on peel: T.Type) -> T {
        return peel.init(app: self.app)
    }
    
    public func peelOff() {
        // Do nothing...
    }
    
}
