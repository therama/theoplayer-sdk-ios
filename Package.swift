// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "THEOplayerSDK",
    platforms: [
        .iOS( .v12),
        .tvOS(.v12)
    ],
    products: [
        .library(name: "THEOplayerSDK", targets: ["THEOplayerSDK"]),
        .library(name: "THEOplayerGoogleCastIntegration", targets: ["THEOplayerGoogleCastIntegration"])
    ],
    dependencies: [
        .package(name: "Swifter", url: "https://github.com/httpswift/swifter.git", .exactItem("1.5.0"))
    ],
    targets: [
        .binaryTarget(
            name: "THEOplayerSDK",
            path: "THEOplayerSDK-core/THEOplayerSDK.xcframework"
        ),
        .binaryTarget(
            name: "THEOplayerGoogleCastIntegrationBinary",
            path: "THEOplayer-Integration-GoogleCast/THEOplayerGoogleCastIntegration.xcframework"
        ),
        .target(
            name: "THEOplayerGoogleCastIntegration",
            dependencies: [
                "Swifter",
                .target(name: "THEOplayerGoogleCastIntegrationBinary")
            ],
            path: "THEOplayer-Integration-GoogleCast"
        ),
    ]
)
