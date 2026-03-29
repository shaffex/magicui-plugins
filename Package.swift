// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "PluginWidgets",
    platforms: [
        .iOS("18.0")
    ],
    products: [
        .library(
            name: "PluginWidgets",
            targets: ["PluginWidgets"]
        ),
        .library(
            name: "MyWidget",
            targets: ["MyWidget"]
        )
    ],
    dependencies: [
        .package(url: "https://gitlab.com/peter.popovec/magicui-framework-beta", branch: "main")
    ],
    targets: [
        .target(
            name: "PluginWidgets",
            dependencies: [
                .product(name: "MagicUi", package: "magicui-framework-beta")
            ],
            path: "Plugins/PluginWidgets/PluginWidgets",
            exclude: [
                "Info.plist",
                "PluginWidgets.entitlements",
                "PluginWidgetsApp.swift"
            ],
            resources: [
                .process("Assets.xcassets"),
                .process("Screens")
            ]
        )
    ]
)
