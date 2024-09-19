//
//  MainPageView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 26/08/24.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        ScrollView(.init()) {
            TabView {
                PopularCostsView()
                
                ImportantMeetingsView()
                
                StockProductView()
                
                SaleTrendView()
                
                MeetingsTodayView()
                
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainPageView()
}
