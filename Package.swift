// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BowlingGameKata",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "BowlingGame", targets: ["BowlingGame"])
    ],
    targets: [
        .executableTarget(
            name: "BowlingGame",
            path: "Sources",
            resources: []
        ),
        .testTarget(
            name: "BowlingGameTests",
            dependencies: ["BowlingGame"], 
            path: "Tests",
            resources: []
        ),
    ]
)
