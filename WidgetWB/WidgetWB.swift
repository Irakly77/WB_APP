//
//  WidgetWB.swift
//  WidgetWB
//
//  Created by Irakli Chachava on 23.06.2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), water: UserDefaultsWater.shared.currentDouble())
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), water: UserDefaultsWater.shared.currentDouble())
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, water: UserDefaultsWater.shared.currentDouble())
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let water:Double
}

struct WidgetWBEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Image("water")
                .resizable()
            VStack {
                Text("\(String(format: "%.0f", entry.water)) Мл")
                Button(intent: WaterIntents()) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .fontWeight(.light)
                        .padding()
                }
                
            }
        }
    }
}

struct WidgetWB: Widget {
    let kind: String = "WidgetWB"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetWBEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Water Tracker")
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    WidgetWB()
} timeline: {
    SimpleEntry(date: .now, water:  500)
}
