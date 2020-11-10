// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 24/07/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public protocol KeyValueStore {
    func has(key: String) -> Bool

    func object(forKey: String) -> Any?
    func string(forKey: String) -> String?
    func bool(forKey: String) -> Bool
    func integer(forKey: String) -> Int
    func double(forKey: String) -> Double
    func array(forKey: String) -> [Any]?
    func dictionary(forKey: String) -> [String:Any]?
    func data(forKey: String) -> Data?
    
    func set(_ string: String?, forKey: String)
    func set(_ bool: Bool, forKey: String)
    func set(_ double: Double, forKey: String)
    func set(_ integer: Int, forKey: String)
    func set(_ array: [Any]?, forKey: String)
    func set(_ dictionary: [String:Any]?, forKey: String)
    func set(_ data: Data?, forKey: String)
}

public extension KeyValueStore {
    func array<T>(forKey key: String, default defaultValue: [T] = []) -> [T] {
        return (array(forKey: key) as? [T]) ?? defaultValue
    }

    func dictionary<K,V>(forKey key: String, default defaultValue: Dictionary<K,V> = [:]) -> Dictionary<K,V> {
        return (dictionary(forKey: key) as? Dictionary<K,V>) ?? defaultValue
    }

    func uniqueKey(withName name: String) -> String {
        var count = 2
        var key = name
        while has(key: key) {
            key = "\(name)-\(count)"
            count += 1
        }
        return key
    }
}
