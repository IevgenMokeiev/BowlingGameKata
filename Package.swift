// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BowlingGame",
    platforms: [.macOS(.v12)],
    targets: [
        .executableTarget(
            name: "BowlingGame",
            path: "Sources",
            resources: []
        ),
        .testTarget(
            name: "BowlingGameTests",
            path: "Tests",
            resources: []
        ),
    ]
)
