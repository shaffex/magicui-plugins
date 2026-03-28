//
//  ContentView.swift
//  PluginWidgets
//
//  Created by Peter Popovec on 13/03/2026.
//

import SwiftUI
import MagicUiFramework

struct ContentView: View {
    init() {
        WidgetTemplates().createTemplate()
        
        WidgetSharedFileStore.saveTextFile("<body><text>Hello, xanka!</text></body>", fileName: "kokoce.xml")
        
        // new actions
        MagicUiView.installActionPlugin(name: "reloadAllTimelines", plugin: Action_reloadAllTimelines.self)
        
        MagicUiView.installActionPlugin(name: "setWidget", plugin: SxAction_setWidget.self)
        
        
    }
    
    var body: some View {
        MagicUiView(resource: "Main")
            .onAction { (action, param) in
            }
    }
}

#Preview {
    ContentView()
}
