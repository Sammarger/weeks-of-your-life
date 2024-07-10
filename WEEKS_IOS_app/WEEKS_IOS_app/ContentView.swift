//
//  ContentView.swift
//  WEEKS_IOS_app
//
//  Created by Samuel Marg on 03/07/2024.
import SwiftUI
import Foundation
struct ContentView: View {
    @State var opacity: Double = 0
    
    var body: some View {
        
        let currentWeek = getCurrentWeekOfYear()

        ZStack(alignment: .center) {
            LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 5), count: 5), spacing: 10)  {
                ForEach(0..<gridSize, id: \.self) { index in
                    Rectangle()
                        .fill(getColorForWeek(atIndex: index, currentWeek: getCurrentWeekOfYear()!))
                        .frame(width: 30, height: 30)
                }
            }
            .padding()
            .frame(width: 250, height: 450)
        }
        
        HStack {
            Text("\(currentWeek ?? 52) / 52 Weeks have passed this year")
                .font(.headline) // Adjust font style as needed
                .padding() // Adds padding around the text
                .opacity(opacity)
                }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                    opacity = 1
                }
        }
        
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
    
}
