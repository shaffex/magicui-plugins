//
//  WidgetTemplates.swift
//  PluginWidgets
//
//  Created by Peter Popovec on 14/03/2026.
//

import MagicUiFramework

struct WidgetTemplates {
    
    let w1 = """
        <body>
        <text>Hello, Janka Piča!
        </text>
        </body>
        """
    
    let w2 = """
        <body>
        <text>Hello, DANULKA!
        </text>
        </body>
        """
    
    func generateXml(index: Int) -> String {
        let xml = """
            <body>
            <vstack>
            <text font="title">timeline \(index)</text>
            <text>Minutes \(index * 15)</text>
            </vstack>
            </body>
            """
        return xml
    }
    
    func generateXml(text: String) -> String {
        let xml = """
            <body>
            <text foregroundColor="red">This is \(text)
            </text>
            </body>
            """
        return xml
    }
    
    func generateXmlNet(text: String) -> String {
        let xml = """
            <body>
            <text foregroundColor="red">NET \(text)
            </text>
            </body>
            """
        return xml
    }
    
    func createTemplate() {
        SxWidetSharedCode.saveToSharedFile(widgetId: "janka.xml", xml: w1)
        SxWidetSharedCode.saveToSharedFile(widgetId: "danka.xml", xml: w2)
        
        SxWidetSharedCode.saveToSharedFile(widgetId: "widget1_small_placeholder.xml", xml: generateXml(text: "placeholder"))
        SxWidetSharedCode.saveToSharedFile(widgetId: "widget1_small_snapshot.xml", xml: generateXml(text: "snapshot"))
        
        SxWidetSharedCode.saveToSharedFile(widgetId: "netwidget1_small_snapshot.xml", xml: generateXmlNet(text: "snapshot"))
        
        for t in 0..<5 {
            SxWidetSharedCode.saveToSharedFile(widgetId: "widget1_small_timeline\(t).xml", xml: generateXml(index: t))
        }
    }
}
