// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 05/10/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

extension NSUbiquitousKeyValueStore: KeyValueStore {
    public func has(key: String) -> Bool { object(forKey: key) != nil }
    public func set(_ int: Int, forKey key: String) { set(Int64(int), forKey: key) }
    public func integer(forKey key: String) -> Int { return Int(longLong(forKey: key)) }
}
