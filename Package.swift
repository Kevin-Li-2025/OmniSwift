// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "OmniSwift",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/elementary-swift/elementary-ui.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "OmniSwift",
            dependencies: [
                .product(name: "ElementaryUI", package: "elementary-ui")
            ],
            path: "src"
        )
    ]
)
