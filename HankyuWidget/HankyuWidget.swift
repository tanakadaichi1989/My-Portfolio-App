//
//  HankyuWidget.swift
//  HankyuWidget
//
//  Created by 田中大地 on 2022/03/27.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        let stations = ModelData().stations
        return SimpleEntry(date: Date(), configuration: ConfigurationIntent(), stations: stations)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let stations = ModelData().stations
        let entry = SimpleEntry(date: Date(), configuration: configuration, stations: stations)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let stations = ModelData().stations

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, stations: stations)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let stations: [Station]
}

struct HankyuWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        LineWidgetView(stations: entry.stations)
            .padding()
    }
}

@main
struct HankyuWidget: Widget {
    let kind: String = "HankyuWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            HankyuWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Hankyu")
        .description("This is Hankyu App widget.")
        .supportedFamilies([.systemSmall])
    }
}

struct HankyuWidget_Previews: PreviewProvider {
    @StateObject private var modelData = ModelData()
    
    static var previews: some View {
        HankyuWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), stations: []))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
