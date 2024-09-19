//
//  WeekShowView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 14/08/24.
//

import SwiftUI

struct WeekShowView: View {
    @State private var currentDate: Date = .init()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    @Namespace private var animation
    var body: some View {
            HStack {
                TabView(selection: $currentWeekIndex) {
                    ForEach(weekSlider.indices, id: \.self) { index in
                        let week = weekSlider[index]
                        WeekView(week)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .onAppear(perform: {
                if weekSlider.isEmpty {
                    let currentDay = Date().fetchWeek()
                    weekSlider.append(currentDay)
                }
        })
    }
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 17) {
            ForEach(week) { day in
                VStack() {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
    
    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
#Preview {
    WeekShowView()
}
