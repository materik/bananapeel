
import BananaPeel

final class RedBananaPeel: BananaPeel, NavigationBarPeel, TabBarPeel {
    
    func tapOnBlueTab() -> BlueBananaPeel {
        return self.tap(onTab: "Blue", peel: BlueBananaPeel.self)
    }
    
    func assertSelectedTabBarTitle() -> RedBananaPeel {
        return self.assert(selectedTabBarTitle: "Red")
    }
    
    func assertNavigationBarTitle() -> RedBananaPeel {
        return self.assert(navigationBarTitle: "Red")
    }

}
