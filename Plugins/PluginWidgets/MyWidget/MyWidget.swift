//
//  MyWidget.swift
//  MyWidget
//
//  Created by Peter Popovec on 13/03/2026.
//

import WidgetKit
import SwiftUI

import MagicUiFramework
import AudioToolbox // test only

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), family: context.family, widgetPostFix: "placeholder")
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration, family: context.family, widgetPostFix: "snapshot")
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let intervalMinutes = configuration.refreshInterval.minutes
        let entryCount = 4
        let currentDate = Date()
        let firstEntryDate = Self.alignedDate(from: currentDate, intervalMinutes: intervalMinutes)

        let entries: [SimpleEntry] = (0..<entryCount).map { offset in
            let entryDate = Calendar.current.date(
                byAdding: .minute,
                value: offset * intervalMinutes,
                to: firstEntryDate
            )!
            return SimpleEntry(
                date: entryDate,
                configuration: configuration,
                family: context.family,
                widgetPostFix: "timeline\(Self.slotIndex(for: entryDate, intervalMinutes: intervalMinutes, entryCount: entryCount))"
            )
        }
        
        for entry in entries {
            print("🗓️ \(entry.date): Slot \(Self.slotIndex(for: entry.date, intervalMinutes: intervalMinutes, entryCount: entryCount))")
        }

        //AudioServicesPlaySystemSound(1007)
        
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    private static func slotIndex(for date: Date, intervalMinutes: Int, entryCount: Int) -> Int {
        let cal = Calendar.current
        let comps = cal.dateComponents([.hour, .minute], from: date)
        let hour = comps.hour ?? 0
        let minute = comps.minute ?? 0

        if intervalMinutes < 60 {
            // Use only the minute within the hour — resets every hour
            // :00 → 0, :15 → 1, :30 → 2, :45 → 3  (for 15-min)
            return (minute / intervalMinutes) % entryCount
        } else {
            // Use hour component
            // 00:xx → 0, 01:xx → 1 ...  (for 1h)
            // 00:xx → 0, 06:xx → 1 ...  (for 6h)
            return (hour / (intervalMinutes / 60)) % entryCount
        }
    }
    
    private static func alignedDate(from date: Date, intervalMinutes: Int) -> Date {
        let cal = Calendar.current
        let comps = cal.dateComponents([.hour, .minute], from: date)
        let totalMinutes = (comps.hour ?? 0) * 60 + (comps.minute ?? 0)
        let flooredMinutes = (totalMinutes / intervalMinutes) * intervalMinutes
        let startOfDay = cal.startOfDay(for: date)
        return cal.date(byAdding: .minute, value: flooredMinutes, to: startOfDay)!
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let family: WidgetFamily
    let widgetPostFix: String
}



struct MyWidget: Widget {
    let kind: String = "widget1"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            MyWidgetEntryView(entry: entry, kind: kind)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

#Preview(as: .systemSmall) {
    MyWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .e15, family: .systemMedium, widgetPostFix: "timeline0")
    SimpleEntry(date: .now, configuration: .e15, family: .systemSmall, widgetPostFix: "snapshot")
}
