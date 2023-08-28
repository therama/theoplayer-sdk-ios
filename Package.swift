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
        .library(name: "THEOplayerGoogleCastIntegration", targets: ["THEOplayerGoogleCastIntegrationTarget"])
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
            name: "THEOplayerGoogleCastIntegration",
            path: "THEOplayer-Integration-GoogleCast/THEOplayerGoogleCastIntegration.xcframework"
        ),
        .target(
            name: "THEOplayerGoogleCastIntegrationTarget",
            dependencies: [
                "Swifter",
                .target(name: "THEOplayerGoogleCastIntegration")
            ],
            path: "THEOplayer-Integration-GoogleCast/THEOplayerGoogleCastIntegration.xcframework"
        ),
    ]
)
