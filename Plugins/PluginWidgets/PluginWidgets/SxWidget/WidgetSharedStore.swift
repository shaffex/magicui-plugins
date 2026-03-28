//
//  WidgetSharedStore.swift
//  PluginWidgets
//
//  Created by Peter Popovec on 13/03/2026.
//

import WidgetKit

enum WidgetSharedStore {
    static let groupID = WidgetConstants.appGroupID
    static let defaults = UserDefaults(suiteName: groupID)

    enum Key {
        static let username = "username"
        static let score = "score"
    }

    static func save(username: String, score: Int) {
        defaults?.set(username, forKey: Key.username)
        defaults?.set(score, forKey: Key.score)
        WidgetCenter.shared.reloadAllTimelines()
    }

    static func load() -> (username: String, score: Int) {
        let username = defaults?.string(forKey: Key.username) ?? "Unknown"
        let score = defaults?.integer(forKey: Key.score) ?? 0
        return (username, score)
    }
}

// WidgetSharedStore.save(username: "Peter", score: 42)
