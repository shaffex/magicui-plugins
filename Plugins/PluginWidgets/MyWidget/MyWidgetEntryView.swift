//
//  MyWidgetEntryView.swift
//  MyWidget
//
//  Created by Peter Popovec on 13/03/2026.
//

import WidgetKit
import SwiftUI
import MagicUiFramework

#if DEBUG
let DEBUG_WIDGET_DIMENSIONS = false
#endif

struct MyWidgetEntryView : View {
    var entry: Provider.Entry
    let kind: String

    var body: some View {
#if DEBUG
        if DEBUG_WIDGET_DIMENSIONS {
            GeometryReader { proxy in
                let width = proxy.size.width
                let height = proxy.size.height
                ZStack {
                    Color.black.opacity(0.7)
                    VStack(spacing: 8) {
                        Text(String(format: "%.0f × %.0f", width, height))
                            .bold()
                            .foregroundColor(.white)
                        Text("points")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                }
            }
        } else {
            if entry.widgetPostFix > "timeline4" {
                Text("KOKOCE: \(entry.family) \(entry.widgetPostFix)")
            } else {
//                MagicUiWidgetView(string: "<body><text>Hello, world!</text></body>")
                MagicUiWidgetView(string: SxWidetSharedCode.loadFromSharedFile(filename: SxWidetSharedCode.getFileName(kind: kind, family: entry.family, postFix: entry.widgetPostFix)) ?? "")
                    .widgetURL(URL(string: kind)!)
            }
        }
#else
        MagicUiWidgetView(string: SxWidetSharedCode.loadFromSharedFile(filename: SxWidetSharedCode.getFileName(kind: kind, family: entry.family, postFix: entry.widgetPostFix)) ?? "")
            .widgetURL(URL(string: kind)!)
#endif
    }
}

struct MyNetworkWidgetEntryView : View {
    var entry: NetworkWidgetProvider.Entry
    let kind: String

    var body: some View {
#if DEBUG
        if DEBUG_WIDGET_DIMENSIONS {
            GeometryReader { proxy in
                let width = proxy.size.width
                let height = proxy.size.height
                ZStack {
                    Color.black.opacity(0.7)
                    VStack(spacing: 8) {
                        Text(String(format: "%.0f × %.0f", width, height))
                            .bold()
                            .foregroundColor(.white)
                        Text("points")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                }
            }
        } else {
            if entry.widgetPostFix > "timeline4" {
                Text("KOKOCE: \(entry.family) \(entry.widgetPostFix)")
            } else {
//                MagicUiWidgetView(string: "<body><text>Hello, world!</text></body>")
                MagicUiWidgetView(string: SxWidetSharedCode.loadFromSharedFile(filename: SxWidetSharedCode.getFileName(kind: kind, family: entry.family, postFix: entry.widgetPostFix)) ?? "")
                    .widgetURL(URL(string: kind)!)
            }
        }
#else
        MagicUiWidgetView(string: SxWidetSharedCode.loadFromSharedFile(filename: SxWidetSharedCode.getFileName(kind: kind, family: entry.family, postFix: entry.widgetPostFix)) ?? "")
            .widgetURL(URL(string: kind)!)
#endif
    }
}
