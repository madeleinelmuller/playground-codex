// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "AIImagePlayground",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "AIImagePlayground", targets: ["AIImagePlayground"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.90.0")
    ],
    targets: [
        .executableTarget(
            name: "AIImagePlayground",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ],
            path: "Sources"
        )
    ]
)
