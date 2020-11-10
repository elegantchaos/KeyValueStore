// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 05/10/2020.
//  All code (c) 2020 - present day, Sam Deane.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import XCTest
import XCTestExtensions

@testable import KeyValueStore

final class KeyValueStoreTests: XCTestCase {
    func verify<T>(value: T, expected: T) -> Bool where T: Equatable {
        let match = value == expected
        XCTAssertTrue(match, "\(T.self) failed")
        return match
    }
    
    func verifyConformance(of store: KeyValueStore?) -> Bool {
        guard let store = store else {
            XCTFail("store does not conform to protocol")
            return false
        }
        
        store.set(1, forKey: "int")
        guard verify(value: store.integer(forKey: "int"), expected: 1) else { return false }

        store.set(1.23, forKey: "double")
        guard verify(value: store.double(forKey: "double"), expected: 1.23) else { return false }

        store.set(true, forKey: "bool")
        guard verify(value: store.bool(forKey: "bool"), expected: true) else { return false }

        store.set("blah", forKey: "string")
        guard verify(value: store.string(forKey: "string"), expected: "blah") else { return false }

        let array: [Int] = [1,2,3]
        store.set(array, forKey: "array")
        guard verify(value: store.array(forKey: "array"), expected: array) else { return false }

        let dict = ["test": 123]
        store.set(dict, forKey: "dictionary")
        guard verify(value: store.dictionary(forKey: "dictionary"), expected: dict) else { return false }

        guard verify(value: store.has(key: "dictionary"), expected: true) else { return false }
        guard verify(value: !store.has(key: "non-existent"), expected: true) else { return false }

        let data = "test".data(using: .utf8)
        store.set(data, forKey: "data")
        guard verify(value: store.data(forKey: "data"), expected: data) else { return false }

        guard verify(value: store.uniqueKey(withName: "test"), expected: "test") else { return false }
        guard verify(value: store.uniqueKey(withName: "string"), expected: "string-2") else { return false }

        return true
    }
    
    func testUserDefaultsConforms() {
        XCTAssert(verifyConformance(of: UserDefaults.standard))
    }
    
    func testNSUbiquitousKeyValueStoreConforms() {
        let store = NSUbiquitousKeyValueStore()
        XCTAssert(verifyConformance(of: store))
    }
}
