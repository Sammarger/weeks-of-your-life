//
//  WEEKS_widgetLiveActivity.swift
//  WEEKS_widget
//
//  Created by Samuel Marg on 08/07/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WEEKS_widgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WEEKS_widgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WEEKS_widgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WEEKS_widgetAttributes {
    fileprivate static var preview: WEEKS_widgetAttributes {
        WEEKS_widgetAttributes(name: "World")
    }
}

extension WEEKS_widgetAttributes.ContentState {
    fileprivate static var smiley: WEEKS_widgetAttributes.ContentState {
        WEEKS_widgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WEEKS_widgetAttributes.ContentState {
         WEEKS_widgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WEEKS_widgetAttributes.preview) {
   WEEKS_widgetLiveActivity()
} contentStates: {
    WEEKS_widgetAttributes.ContentState.smiley
    WEEKS_widgetAttributes.ContentState.starEyes
}
