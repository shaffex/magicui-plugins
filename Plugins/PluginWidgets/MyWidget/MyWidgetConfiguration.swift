//
//  MyWidgetConfiguration.swift
//  PluginWidgets
//
//  Created by Peter Popovec on 17/03/2026.
//

import AppIntents

enum RefreshInterval: String, AppEnum {
    case fifteenMinutes = "15min"
    case thirtyMinutes  = "30min"
    case oneHour        = "1h"
    case sixHours       = "6h"
    case oneDay         = "1d"

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Refresh Interval")
    static var caseDisplayRepresentations: [RefreshInterval: DisplayRepresentation] = [
        .fifteenMinutes: "Every 15 minutes",
        .thirtyMinutes:  "Every 30 minutes",
        .oneHour:        "Every hour",
        .sixHours:       "Every 6 hours",
        .oneDay:         "Every day",
    ]

    var minutes: Int {
        switch self {
        case .fifteenMinutes: return 15
        case .thirtyMinutes:  return 30
        case .oneHour:        return 60
        case .sixHours:       return 360
        case .oneDay:         return 1440
        }
    }
}

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"

    @Parameter(title: "Refresh Interval", default: .fifteenMinutes)
    var refreshInterval: RefreshInterval

    // ... your existing parameters
}

extension ConfigurationAppIntent {
    static var e15: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.refreshInterval = .fifteenMinutes
        return intent
    }
}
