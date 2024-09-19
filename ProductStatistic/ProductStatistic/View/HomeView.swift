//
//  HomeView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 12/08/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Color(.systemGray4).background()
                .ignoresSafeArea()
            VStack {
                HeaderVIew()
                
                CircleStatsView()
                    .offset(y: -90)
                
                SmallRectangularCostView()
            }
        }
        
    }
}

#Preview {
    HomeView()
}
