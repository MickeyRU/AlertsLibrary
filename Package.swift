// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "iOSAlertLibrary",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "iOSAlertLibrary",
            targets: ["iOSAlertLibrary"]
        ),
    ],
    dependencies: [
            .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.17.6")
        ],
    targets: [
        .target(
            name: "iOSAlertLibrary",
            path: "Sources/iOSAlertLibrary"
        ),
        .testTarget(
            name: "iOSAlertLibraryTests",
            dependencies: ["iOSAlertLibrary", .product(name: "SnapshotTesting", package: "swift-snapshot-testing")],
            path: "Tests/iOSAlertLibraryTests"
        ),
    ]
)
