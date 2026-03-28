//
//  WidgetSharedFile.swift
//  PluginWidgets
//
//  Created by Peter Popovec on 13/03/2026.
//

import WidgetKit

enum WidgetSharedFileStore {
    static let groupID = WidgetConstants.appGroupID

    static var containerURL: URL? {
        FileManager.default.containerURL(
            forSecurityApplicationGroupIdentifier: groupID
        )
    }

    static func fileURL(for fileName: String) -> URL? {
        containerURL?.appendingPathComponent(fileName)
    }

    static func save(_ data: Data, fileName: String) {
        guard let url = fileURL(for: fileName) else { return }

        do {
            try data.write(to: url, options: .atomic)
            WidgetCenter.shared.reloadAllTimelines()
        } catch {
            print("WidgetSharedFileStore save error:", error)
        }
    }

    static func save(_ string: String, fileName: String) {
        guard let data = string.data(using: .utf8) else { return }
        save(data, fileName: fileName)
    }

    static func saveTextFile(_ text: String, fileName: String) {
        save(text, fileName: fileName)
    }

    static func load(fileName: String) -> Data? {
        guard let url = fileURL(for: fileName) else { return nil }
        return try? Data(contentsOf: url)
    }

    static func loadString(fileName: String) -> String? {
        guard let data = load(fileName: fileName) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    static func loadTextFile(fileName: String) -> String? {
        loadString(fileName: fileName)
    }
}
