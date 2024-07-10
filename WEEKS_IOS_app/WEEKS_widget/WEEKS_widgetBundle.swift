//
//  WEEKS_widgetBundle.swift
//  WEEKS_widget
//
//  Created by Samuel Marg on 08/07/2024.
//

import WidgetKit
import SwiftUI

@main
struct WEEKS_widgetBundle: WidgetBundle {
    var body: some Widget {
        WeekCalendarWidget()
        WEEKS_widgetLiveActivity()
    }
}
