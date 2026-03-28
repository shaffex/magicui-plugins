//
//  NewActions.swift
//  PluginWidgets
//
//  Created by Peter Popovec on 13/03/2026.
//

import MagicUiFramework
import WidgetKit

struct Action_reloadAllTimelines: SxActionProtocol {
    let node: MagicNode?
    
    func execute(_ actionString: String) {
        WidgetCenter.shared.reloadAllTimelines()
    }
}

struct SxAction_setWidget: SxActionProtocol {
    var node: MagicNode?
    
    func execute(_ actionString: String) {
        let dict = actionString.dict
        
        if let id = dict["id"], let file = dict["file"] {
            let xml = SxWidetSharedCode.loadFromSharedFile(filename: file) ?? "<body><text>Cannot read widget file</text></body>"
            //let xml = WidgetEngine.shared.generateWidgetXml(widgetId: widgetId)
            SxWidetSharedCode.saveToSharedFile(widgetId: id + ".xml", xml: xml)
            SxWidetSharedCode.reloadAllWidgets()
        }
        
    }
}
