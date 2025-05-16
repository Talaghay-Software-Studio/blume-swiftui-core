// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlumeSwiftUI",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BlumeSwiftUI",
            targets: ["BlumeSwiftUI"]),
    ],
    targets: [
        .target(
            name: "BlumeSwiftUI",
            dependencies: [],
            path: "Sources/BlumeSwiftUI",
            resources: [
                .process("CustomFont/Aeonik"),
                .process("CustomFont/Crapaud")
            ]
        )
    ]
)
