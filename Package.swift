// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Attribeautify",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "Attribeautify",
            targets: ["Attribeautify"]
        )
    ],
    targets: [
        .target(
            name: "Attribeautify",
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
