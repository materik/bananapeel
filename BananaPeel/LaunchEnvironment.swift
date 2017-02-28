
class LaunchEnvironment {

    private(set) var dictionary: [String: String] = [:]
    
    @discardableResult
    func add(key: String, value: String) -> Self {
        dictionary[key] = value
        return self
    }
    
}
