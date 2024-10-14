// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Parrot",
    products: [
        .library(
            name: "Parrot",
            targets: ["Parrot"]
        ),
    ],
    targets: [
        .target(
            name: "Parrot",
            dependencies: []
        ),
        .testTarget(
            name: "ParrotTests",
            dependencies: ["Parrot"]
        ),
    ]
)
