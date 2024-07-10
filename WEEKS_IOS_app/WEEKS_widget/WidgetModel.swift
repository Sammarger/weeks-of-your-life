//
//  WidgetModel.swift
//  WEEKS_IOS_app
//
//  Created by Samuel Marg on 09/07/2024.
//

import Foundation
import SwiftUI

func generateGrid() -> some View {
    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 5), count: 11), spacing: 5)  {
        ForEach(0..<widgetGridSize, id: \.self) { index in
            Rectangle()
                .fill(getColorForWeek(atIndex: index, currentWeek: getCurrentWeekOfYear()!))
                .frame(width: 15, height: 15)
        }
    }
    .padding()
    .frame(width: 250, height: 100)
}

func getColorForWeek(atIndex index: Int, currentWeek num: Int) -> Color {
    guard index > num else {
        return Color.black
    }
    
    return Color.gray
}

func getCurrentWeekOfYear() -> Int? {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.weekOfYear], from: Date())
    return components.weekOfYear
}

public struct WidgetDimension {
    var _height: Int
    var _width: Int
    
    var height: Int {
        get { return _height }
        set(newValue) {
            if newValue >= 0 {
                _height = newValue
            } else {
                print("Error: Height cannot be negative.")
            }
        }
    }
    
    var width: Int {
        get { return _width }
        set(newValue) {
            if newValue >= 0 {
                _width = newValue
            } else {
                print("Error: Width cannot be negative.")
            }
        }
    }
    
    func getTotal() -> Int {
        return _height * _width
    }
}
let widgetGridDimensions = WidgetDimension(_height: 11, _width: 5)
let widgetGridSize = widgetGridDimensions.getTotal()
