
import XCTest

public extension XCUIElement {
    
    var isVisible: Bool {
        return self.exists && self.isHittable
    }
    
    func waitUntilNotVisible(timeout: TimeInterval = TimeInterval.timeout) {
        return self.waitUntil(timeout: timeout) {
            return !$0.isVisible
        }
    }
    
    func waitUntilVisible(timeout: TimeInterval = TimeInterval.timeout) {
        return self.waitUntil(timeout: timeout) {
            return $0.isVisible
        }
    }
    
    func waitUntil(timeout: TimeInterval = TimeInterval.timeout, closure: (XCUIElement) -> (Bool)) {
        let startTime = Date().timeIntervalSince1970
        while !closure(self) {
            if Date().timeIntervalSince1970 - startTime > timeout {
                XCTFail("Timed out! (\(XCUIApplication().debugDescription))")
                return
            }
            CFRunLoopRunInMode(CFRunLoopMode.defaultMode, 0.1, false);
        }
    }
    
}
