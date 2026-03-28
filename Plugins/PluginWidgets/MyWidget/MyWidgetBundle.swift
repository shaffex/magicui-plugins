//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by Peter Popovec on 13/03/2026.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    init() {
        PluginWidgets.initialise()
    }
    
    var body: some Widget {
        MyWidget()
        MyNetworkWidget()
        MyWidgetControl()
        MyWidgetLiveActivity()
    }
}
