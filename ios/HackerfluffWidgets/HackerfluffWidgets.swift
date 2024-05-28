//
//  HackerfluffWidgets.swift
//  HackerfluffWidgets
//
//  Created by Andreas Lay on 27.05.24.
//

import WidgetKit
import SwiftUI
import Foundation


struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> PagedStoriesStateTimelineEntry {
        PagedStoriesStateTimelineEntry(stories: [
            Story(title: "Ask HN: What would you spend your time working on if you didn't need money?", id: 1),
            Story(title: "Electromagnetic Waves and Antennas", id: 2),
            Story(title: "TTE: Terminal Text Effects", id: 3),
            Story(title: "An air quality model that is evolving with the times", id: 4),
            Story(title: "A robot will soon try to remove melted nuclear fuel from Fukushima reactor", id: 5)        ], date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (PagedStoriesStateTimelineEntry) -> ()) {
        let state: PagedStoriesStateTimelineEntry
        if context.isPreview {
            state = placeholder(in: context)
        } else {
            let userDefaults = UserDefaults(suiteName: "group.com.layandreas.hackerfluff")
            if let jsonString = userDefaults?.string(forKey: "storiesForHomeWidget"),
               let jsonData = jsonString.data(using: .utf8),
               let decodedState = try? JSONDecoder().decode(PagedStoriesState.self, from: jsonData) {
                state = PagedStoriesStateTimelineEntry(currentPage:decodedState.currentPage, stories: decodedState.stories, date: Date())
            } else {
                state = PagedStoriesStateTimelineEntry(date: Date())
            }
        }
        completion(state)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<PagedStoriesStateTimelineEntry>) -> ()) {
        getSnapshot(in: context) { (state) in
            let timeline = Timeline(entries: [state], policy: .atEnd)
            completion(timeline)
        }
    }
}

struct HackerfluffWidgetsEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        if entry.stories.isEmpty {
            Text("No stories to show!").lineLimit(4)
        } else {
            Text("**Stories**").foregroundColor(Color(red: 217/255, green:93/255,blue:5/255))

            Divider().padding([.bottom], 3)

            switch family {
            case .systemSmall:
                displayStories(upToIndex: 0)
            case .systemMedium:
                displayStories(upToIndex: 1)
            case .systemLarge:
                displayStories(upToIndex: 4)
            default:
                displayStories(upToIndex: 1)
            }
        }
    }
    
    @ViewBuilder
    private func displayStories(upToIndex index: Int) -> some View {
        VStack {
            ForEach(Array(entry.stories.enumerated()), id: \.offset) { i, story in
                if i <= index {
                    Text(story.title).lineLimit(2).frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                }
            }
        }
    }
}


struct HackerfluffWidgets: Widget {
    let kind: String = "HackerfluffWidgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                HackerfluffWidgetsEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                HackerfluffWidgetsEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Hackerfluff Widgets")
        .description("Hackernews Stories")
    }
}


#Preview(as: .systemMedium) {
    HackerfluffWidgets()
} timeline: {
    PagedStoriesStateTimelineEntry(stories: [
        Story(title: "Ask HN: What would you spend your time working on if you didn't need money?", id: 1),
        Story(title: "Electromagnetic Waves and Antennas", id: 2),
        Story(title: "TTE: Terminal Text Effects", id: 3),
        Story(title: "An air quality model that is evolving with the times", id: 4),
        Story(title: "A robot will soon try to remove melted nuclear fuel from Fukushima reactor", id: 5)
    ],date: Date())
}


struct PagedStoriesStateTimelineEntry: Decodable, TimelineEntry {
    var currentPage: Int = 0
    var stories: [Story] = []
    var storiesPerPage: Int = 2
    var isLoading: Bool = false
    var reachedEnd: Bool = false
    var nErrors: Int = 0
    var date: Date
}


struct PagedStoriesState: Decodable {
    var currentPage: Int = 0
    var stories: [Story] = []
    var storiesPerPage: Int = 2
    var isLoading: Bool = false
    var reachedEnd: Bool = false
    var nErrors: Int = 0
}


struct Story: Decodable, Identifiable {
    var title: String
    var id: Int
    var kids: [Int]?
    var descendants: Int?
    var by: String?
    var score: Int?
    var time: Int?
    var type: String?
    var url: String?
    var nCommentsSeen: Int?
    var text: String?
}
