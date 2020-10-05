// swift-tools-version:5.2

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 05/10/2020.
//  All code (c) 2020 - present day, Sam Deane.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import PackageDescription

let package = Package(
    name: "KeyValueStore",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "KeyValueStore",
            targets: ["KeyValueStore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/elegantchaos/XCTestExtensions", from: "1.1.2")
    ],
    targets: [
        .target(
            name: "KeyValueStore",
            dependencies: []),
        .testTarget(
            name: "KeyValueStoreTests",
            dependencies: ["KeyValueStore", "XCTestExtensions"]),
    ]
)
