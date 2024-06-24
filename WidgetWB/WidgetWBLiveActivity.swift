//
//  WidgetWBLiveActivity.swift
//  WidgetWB
//
//  Created by Irakli Chachava on 23.06.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetWBAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }
    
    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetWBLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetWBAttributes.self) { context in
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

extension WidgetWBAttributes {
    fileprivate static var preview: WidgetWBAttributes {
        WidgetWBAttributes(name: "World")
    }
}

extension WidgetWBAttributes.ContentState {
    fileprivate static var smiley: WidgetWBAttributes.ContentState {
        WidgetWBAttributes.ContentState(emoji: "😀")
    }
    
    fileprivate static var starEyes: WidgetWBAttributes.ContentState {
        WidgetWBAttributes.ContentState(emoji: "🤩")
    }
}

#Preview("Notification", as: .content, using: WidgetWBAttributes.preview) {
    WidgetWBLiveActivity()
} contentStates: {
    WidgetWBAttributes.ContentState.smiley
    WidgetWBAttributes.ContentState.starEyes
}
