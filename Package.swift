// swift-tools-version:5.7

import PackageDescription

internal let package = Package(
    name: "swift-dedici-vapor-toolbox",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "DediciVaporToolbox",
            targets: ["DediciVaporToolbox"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor", .upToNextMajor(from: "4.65.1")),
    ],
    targets: [
        .target(
            name: "DediciVaporToolbox",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
        .testTarget(
            name: "DediciVaporToolboxTests",
            dependencies: [
                .target(name: "DediciVaporToolbox"),
                .product(name: "XCTVapor", package: "vapor"),
            ]
        ),
    ]
)
