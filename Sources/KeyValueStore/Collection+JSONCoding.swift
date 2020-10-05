// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 05/10/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public extension RangeReplaceableCollection where Element: Encodable, Element: Identifiable {
    func save(to store: KeyValueStore, with encoder: JSONEncoder, prefix: String = "item-") {
        for item in self {
            if let encoded = try? encoder.encode(item) {
                store.set(encoded, forKey: "\(prefix)\(item.id)")
            }
        }
    }
    
    mutating func load(from store: KeyValueStore, with decoder: JSONDecoder, idKey: String, prefix: String = "item-") where Element: Decodable {
        if let ids = store.array(forKey: idKey) as? [String] {
            for id in ids {
                if let json = store.data(forKey: "\(prefix)\(id)"), let decoded = try? decoder.decode(Element.self, from: json) {
                    append(decoded)
                }
            }
        }
    }
}
