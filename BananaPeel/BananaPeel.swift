
import XCTest

open class BananaPeel {
    
    public typealias VoidClosure = (XCUIApplication) -> ()
    public typealias ElementClosure = (XCUIApplication) -> (XCUIElement)
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    public required init() {
        _ = self.viewDidAppear()
    }
    
    open func viewDidAppear() -> Self {
        // Overridable method for subclasses to override
        return self
    }
    
    open func viewWillDisappear() -> Self {
        // Overridable method for subclasses to override
        return self
    }
    
    public func assert(closure: VoidClosure) -> Self {
        closure(self.app)
        return self
    }
    
    public func enter(text: String, into element: ElementClosure) -> Self {
        _ = tap(element: element)
        element(self.app).typeText(text)
        return self
    }
    
    public func `if`<T: BananaPeel, S: BananaPeel>(
        condition: (XCUIApplication) -> (Bool),
        onTrue: (T) -> (S),
        onFalse: (T) -> (S),
        from: T.Type,
        to: S.Type
    ) -> S {
        guard let this = self as? T else {
            fatalError()
        }
        if condition(self.app) {
            return onTrue(this)
        } else {
            return onFalse(this)
        }
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
    
    public func tap(element: ElementClosure) -> Self {
        element(self.app).tap()
        return self
    }
    
    public func wait(_ time: UInt32 = 1) -> Self {
        sleep(time)
        return self
    }
    
    public func waitUntilVisible(timeout: TimeInterval = TimeInterval.timeout,
                                 element: ElementClosure) -> Self {
        element(self.app).waitUntilVisible()
        return self
    }
    
    public func waitUntilNotVisible(timeout: TimeInterval = TimeInterval.timeout,
                                    element: ElementClosure) -> Self {
        element(self.app).waitUntilNotVisible()
        return self
    }
    
    public func peel<T: BananaPeel>(on peel: T.Type) -> T {
        _ = self.viewWillDisappear()
        return peel.init()
    }
    
    public func peelOff() {
        self.app.terminate()
    }
    
}
