
import XCTest

class AppTester {

    static func launch(
        launchEnvironment: LaunchEnvironment = LaunchEnvironment()) -> StocksTester {
        let app = XCUIApplication()
        app.launchArguments = ClientTestBridge.test.launchArguments
        app.launchEnvironment = launchEnvironment.rawValue
        app.launch()
        return StocksTester(app: app)
    }

}

typealias VoidClosure = (XCUIApplication) -> ()
typealias ElementClosure = (XCUIApplication) -> (XCUIElement)

class ViewTester {

    internal var app: XCUIApplication

    required init(app: XCUIApplication) {
        self.app = app
    }

    func enter(text: String, element: ElementClosure) -> Self {
        tap(element: element).end()
        element(self.app).typeText(text)
        return self
    }

    func tap(element: ElementClosure) -> Self {
        element(self.app).tap()
        return self
    }

    func assert(closure: VoidClosure) -> Self {
        closure(self.app)
        return self
    }

    func assert(numberOfCells: UInt) -> Self {
        return assert {
            let cells = $0.tables.cells
            XCTAssertEqual(cells.count, numberOfCells)
        }
    }

    func change<T: ViewTester>(into tester: T.Type) -> T {
        return tester.init(app: self.app)
    }

    func end() {
        // Do nothing...
    }

}
