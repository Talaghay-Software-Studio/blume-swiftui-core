// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "BlumeSwiftUI",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "BlumeSwiftUI",
            targets: ["BlumeSwiftUI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BlumeSwiftUI",
            dependencies: []),
        .testTarget(
            name: "BlumeSwiftUITests",
            dependencies: ["BlumeSwiftUI"]),
    ]
) 