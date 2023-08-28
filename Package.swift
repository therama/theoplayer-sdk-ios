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
        .package(name: "GoogleCast", url: "https://github.com/Danesz/google-cast-sdk-dynamic-xcframework", from: "4.7.1")
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
                "GoogleCast",
                .target(name: "THEOplayerGoogleCastIntegrationBinary")
            ],
            path: "THEOplayer-Integration-GoogleCast"
        ),
    ]
)
