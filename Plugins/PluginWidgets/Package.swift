// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PluginWidgets",
    platforms: [
        .iOS(.v17)
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
            path: "PluginWidgets",
            exclude: [
                "Info.plist",
                "PluginWidgets.entitlements",
                "PluginWidgetsApp.swift"
            ],
            resources: [
                .process("Assets.xcassets"),
                .process("Screens")
            ]
        ),
        .target(
            name: "MyWidget",
            dependencies: [
                "PluginWidgets",
                .product(name: "MagicUi", package: "magicui-framework-beta")
            ],
            path: "MyWidget",
            exclude: [
                "Info.plist",
                "MyWidgetExtension.entitlements",
                "TEST.xml"
            ],
            resources: [
                .process("Assets.xcassets")
            ]
        )
    ]
)
