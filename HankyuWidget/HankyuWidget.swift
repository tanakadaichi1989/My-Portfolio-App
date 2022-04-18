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
    @EnvironmentObject var modelData: ModelData
    
    func placeholder(in context: Context) -> SimpleEntry {
        let favoritedStations = modelData.stations.filter { $0.isFavorite == true }
        return SimpleEntry(date: Date(),favoritedStations: favoritedStations)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let favoritedStations = modelData.stations.filter { $0.isFavorite == true }
        let entry = SimpleEntry(date: Date(),favoritedStations: favoritedStations)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        let favoritedStations = ModelData().stations.filter { $0.isFavorite == true }

        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate,favoritedStations: favoritedStations)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let favoritedStations: [Station]
}

struct HankyuWidgetEntryView : View {
    var entry: Provider.Entry
    
    private func getCountFavoritedStation(by line:Line) -> Int {
        entry.favoritedStations.filter { $0.line == line && $0.isFavorite == true }.count
    }

    var body: some View {
        VStack {
            ForEach(Line.allCases,id:\.self){ line in
                HStack {
                    Rectangle()
                        .foregroundColor(line.getLineColor())
                        .frame(width: 10, height: 20)
                    Text("\(line.getLineName())")
                        .fontWeight(.bold)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.pink)
                    Text("\(getCountFavoritedStation(by: line))")
                }
            }
        }
    }
}

@main
struct HankyuWidget: Widget {
    let kind: String = "MyPortfolioWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            HankyuWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Portfolio")
        .description("This is My Portfolio App widget.")
        .supportedFamilies([.systemSmall])
    }
}

struct HankyuWidget_Previews: PreviewProvider {
    @StateObject private var modelData = ModelData()
    
    static var previews: some View {
        HankyuWidgetEntryView(entry: SimpleEntry(date: Date(),favoritedStations: ModelData().stations))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
