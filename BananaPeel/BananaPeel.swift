
import XCTest

open class BananaPeel {
    
    public typealias VoidClosure = (XCUIApplication) -> ()
    public typealias ElementClosure = (XCUIApplication) -> (XCUIElement)
    
    private let app: XCUIApplication
    
    public required init(app: XCUIApplication) {
        self.app = app
        self.viewDidAppear().peelOff()
    }
    
    open func viewDidAppear() -> Self {
        // Overridable method for subclasses to override
        return self
    }
    
    open func viewWillDisappear() -> Self {
        // Overridable method for subclasses to override
        return self
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
    
    public func swipeDown(element: ElementClosure) -> Self {
        element(self.app).swipeDown()
        return self
    }
    
    public func swipeLeft(element: ElementClosure) -> Self {
        element(self.app).swipeLeft()
        return self
    }
    
    public func swipeRight(element: ElementClosure) -> Self {
        element(self.app).swipeRight()
        return self
    }
    
    public func swipeUp(element: ElementClosure) -> Self {
        element(self.app).swipeUp()
        return self
    }
    
    public func assert(closure: VoidClosure) -> Self {
        closure(self.app)
        return self
    }
    
    public func peel<T: BananaPeel>(on peel: T.Type) -> T {
        self.viewWillDisappear().peelOff()
        return peel.init(app: self.app)
    }
    
    public func peelOff() {
        // Do nothing...
    }
    
}
