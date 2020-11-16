// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 05/10/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

extension UserDefaults: KeyValueStore {
    public func has(key: String) -> Bool {
        object(forKey: key) != nil
    }
    
    public func set(_ dictionary: [String : Any]?, forKey key: String) {
        set(dictionary as Any, forKey: key)
    }
    
    public func set(_ string: String?, forKey key: String) {
        set(string as Any, forKey: key)
    }
    
    public func set(_ array: [Any]?, forKey key: String) {
        set(array as Any, forKey: key)
    }
    
    public func set(_ data: Data?, forKey key: String) {
        set(data as Any, forKey: key)
    }
    
    public func remove(key: String) {
        removeObject(forKey: key)
    }
}
