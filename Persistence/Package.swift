// swift-tools-version:5.3
import PackageDescription

let package = Package(name: "NoDevExample")

package.platforms = [
    .macOS(.v10_15)
]

package.dependencies = [
    .package(url: "https://github.com/vapor/vapor", .upToNextMajor(from: "4.0.0"))
]

package.targets = [
    .target(name: "Server", dependencies: [
        .product(name: "Vapor", package: "vapor")
    ]),
    .target(name: "Run", dependencies: [
        .target(name: "Server")
    ]),
]

package.products = [
    .library(name: "Server", targets: ["Server"]),
    .executable(name: "Run", targets: ["Run"]),
]
