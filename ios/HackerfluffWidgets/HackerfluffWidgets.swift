//
//  HackerfluffWidgets.swift
//  HackerfluffWidgets
//
//  Created by Andreas Lay on 27.05.24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> Story {
        Story(date: Date(), title: "Regular Expression Matching with a Trigram Index")
    }

    func getSnapshot(in context: Context, completion: @escaping (Story) -> ()) {
        let story: Story
        if context.isPreview{
            story = placeholder(in: context)
        } else {
            let userDefaults = UserDefaults(suiteName: "group.com.layandreas.hackerfluff")
            let title = userDefaults?.string(forKey: "widgetTitle") ?? "No title found"
            story = Story(date: Date(), title: title)
        }
        completion(story)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Story>) -> ()) {
        getSnapshot(in: context) {(story) in
            let timeline = Timeline(entries: [story], policy: .atEnd)
            completion(timeline)
        }
    }
}

struct Story: TimelineEntry {
    let date: Date
    let title: String
}

struct HackerfluffWidgetsEntryView : View {
    var story: Provider.Entry

    var body: some View {
        VStack {
            Text(story.title)
        }
    }
}

struct HackerfluffWidgets: Widget {
    let kind: String = "HackerfluffWidgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                HackerfluffWidgetsEntryView(story: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                HackerfluffWidgetsEntryView(story: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    HackerfluffWidgets()
} timeline: {
    Story(date: .now, title: "This is the title")
    Story(date: .now, title: "This is a second title")
}
