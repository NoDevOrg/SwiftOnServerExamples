// swift-tools-version:5.3
import PackageDescription

let package = Package(name: "NoDevExample")

package.platforms = [
    .macOS(.v10_15)
]

package.dependencies = [
    .package(url: "https://github.com/vapor/vapor", .upToNextMajor(from: "4.0.0")),
    .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
    .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0"),
]

package.targets = [
    .target(name: "Server", dependencies: [
        .product(name: "Vapor", package: "vapor"),
        .product(name: "Fluent", package: "fluent"),
        .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver")
    ]),
    .target(name: "Run", dependencies: [
        .target(name: "Server")
    ]),
]

package.products = [
    .library(name: "Server", targets: ["Server"]),
    .executable(name: "Run", targets: ["Run"]),
]
