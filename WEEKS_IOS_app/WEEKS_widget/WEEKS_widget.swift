//
//
//  WEEKS_widget.swift
//  WEEKS_widget
//
//  Created by Samuel Marg on 08/07/2024.
//

import WidgetKit
import SwiftUI

struct WeekView: View {
    var body: some View {
            generateGrid()
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(date: Date())]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct WeekCalendarWidget: Widget {
    private let kind: String = "WeekCalendarWidget"
    
    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WeekView()
        }
        .configurationDisplayName("Week Calendar Widget")
        .description("This widget shows a year calendar of the weeks past.")
    }
}
