// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DMPClientPublic",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "DMPClientPublic",
            targets: ["DMPClientPublic"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DMPClientPublic",
            dependencies: ["DMPClient"]),
        .binaryTarget(name: "DMPClient", path: "binaries/DMPClient.xcframework"),
    ]
)
