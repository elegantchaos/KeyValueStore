// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 24/07/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

protocol KeyValueStore {
    func object(forKey: String) -> Any?
    func string(forKey: String) -> String?
    func bool(forKey: String) -> Bool
    func integer(forKey: String) -> Int
    func double(forKey: String) -> Double
    func array(forKey: String) -> [Any]?
    func dictionary(forKey: String) -> [String:Any]?
    
    func set(_ string: String?, forKey: String)
    func set(_ bool: Bool, forKey: String)
    func set(_ double: Double, forKey: String)
    func set(_ integer: Int, forKey: String)
    func set(_ array: [Any]?, forKey: String)
    func set(_ dictionary: [String:Any]?, forKey: String)
}

extension KeyValueStore {
    func array<T>(forKey key: String, default defaultValue: [T]) -> [T] {
        return (array(forKey: key) as? [T]) ?? defaultValue
    }
}

extension NSUbiquitousKeyValueStore: KeyValueStore {
    func set(_ int: Int, forKey key: String) { set(Int64(int), forKey: key) }
    func integer(forKey key: String) -> Int { return Int(longLong(forKey: key)) }
}

extension UserDefaults: KeyValueStore {
    func set(_ dictionary: [String : Any]?, forKey key: String) {
        set(dictionary as Any, forKey: key)
    }
    
    func set(_ string: String?, forKey key: String) {
        set(string as Any, forKey: key)
    }
    
    func set(_ array: [Any]?, forKey key: String) {
        set(array as Any, forKey: key)
    }
}
