// swift-tools-version:5.7.1

import PackageDescription

let package = Package(
    name: "PContributionsView",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PContributionsView",
                 targets: ["PContributionsView"])
    ],
    targets: [
        .target(name: "PContributionsView",
                path: "PContributionsView/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
