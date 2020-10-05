# KeyValueStore

The `UserDefaults` and `NSUbiquitousKeyValueStore` classes are pretty much interchangeable, but have slightly different APIs.

This package defines a `KeyValueStore` protocol which abstracts these differences.

In the future, other classes/structs (eg `Dictionary`) could also be made to conform to this protocol. Pull-requests gratefully accepted...

