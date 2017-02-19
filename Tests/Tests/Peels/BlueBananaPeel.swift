
import BananaPeel

final class BlueBananaPeel: BananaPeel, NavigationBarPeel, TabBarPeel {

    func tapOnRedTab() -> RedBananaPeel {
        return self.tap(onTab: "Red", peel: RedBananaPeel.self)
    }
    
    func assertSelectedTabBarTitle() -> BlueBananaPeel {
        return self.assert(selectedTabBarTitle: "Blue")
    }
    
    func assertNavigationBarTitle() -> BlueBananaPeel {
        return self.assert(navigationBarTitle: "Blue")
    }
    
}
