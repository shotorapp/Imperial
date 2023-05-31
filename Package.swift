// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Imperial",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "ImperialCore", targets: ["ImperialCore"]),
        .library(name: "ImperialDropbox", targets: ["ImperialCore", "ImperialDropbox"]),
        .library(name: "ImperialFacebook", targets: ["ImperialCore", "ImperialFacebook"]),
        .library(name: "ImperialGitHub", targets: ["ImperialCore", "ImperialGitHub"]),
        .library(name: "ImperialGitlab", targets: ["ImperialCore", "ImperialGitlab"]),
        .library(name: "ImperialGoogle", targets: ["ImperialCore", "ImperialGoogle"]),
        .library(name: "ImperialKeycloak", targets: ["ImperialCore", "ImperialKeycloak"]),
        .library(name: "ImperialMicrosoft", targets: ["ImperialCore", "ImperialMicrosoft"]),
        .library(name: "ImperialShopify", targets: ["ImperialCore", "ImperialShopify"]),
        .library(name: "ImperialDiscord", targets: ["ImperialCore", "ImperialDiscord"]),
        .library(name: "ImperialPayPal", targets: ["ImperialCore", "ImperialPayPal"]),
        .library(name: "ImperialStrava", targets: ["ImperialCore", "ImperialStrava"]),
        .library(name: "Imperial", targets: [
            "ImperialCore",
            "ImperialDropbox",
            "ImperialFacebook",
            "ImperialGitHub",
            "ImperialGitlab",
            "ImperialGoogle",
            "ImperialKeycloak",
            "ImperialMicrosoft",
            "ImperialShopify",
            "ImperialDiscord",
            "ImperialPayPal",
            "ImperialStrava"
        ]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/jwt-kit.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "ImperialCore",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "JWTKit", package: "jwt-kit"),
            ]
        ),
        .target(name: "ImperialDropbox", dependencies: ["ImperialCore"]),
        .target(name: "ImperialFacebook", dependencies: ["ImperialCore"]),
        .target(name: "ImperialGitHub", dependencies: ["ImperialCore"]),
        .target(name: "ImperialGitlab", dependencies: ["ImperialCore"]),
        .target(name: "ImperialGoogle", dependencies: ["ImperialCore"]),
        .target(name: "ImperialKeycloak", dependencies: ["ImperialCore"]),
        .target(name: "ImperialMicrosoft", dependencies: ["ImperialCore"]),
        .target(name: "ImperialShopify", dependencies: ["ImperialCore"]),
        .target(name: "ImperialDiscord", dependencies: ["ImperialCore"]),
        .target(name: "ImperialPayPal", dependencies: ["ImperialCore"]),
        .target(name: "ImperialStrava", dependencies: ["ImperialCore"]),
        .testTarget(name: "ImperialTests", dependencies: ["ImperialCore", "ImperialShopify"]),
    ]
)
