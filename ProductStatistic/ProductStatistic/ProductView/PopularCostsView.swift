//
//  PopularCostsView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 15/08/24
//

import SwiftUI

struct PopularCostsView: View {
    let data = [150, 20, 55, 270, 125]
    @State private var currentDate: Date = .init()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    var body: some View {
        VStack {
            HStack() {
                Text("Popular \nCosts")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .font(.title3)
                    .foregroundStyle(.black)
            }
            .padding()
            .offset(y: 35)
            
            Spacer(minLength: 0)
            
            HStack(alignment: .bottom, spacing: 20) {
                ForEach(data, id: \.self) { value in
                    Rectangle()
                        .frame(width: 55, height: CGFloat(value))
                        .foregroundStyle(Color("Color4"))
                        .cornerRadius(10)
                }
            }
            //.padding(.bottom, 370)
            .offset(y: 100)
            
            VStack {
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
                .offset(y: 50)
                .onAppear(perform: {
                    if weekSlider.isEmpty {
                        let currentDay = Date().fetchWeek()
                        weekSlider.append(currentDay)
                    }
                })
            }
            
            HStack {
//                ForEach(1..<3, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .cornerRadius(15)
                            .frame(width: 180, height: 230)
                        
                        Image("tiktok")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .background() {
                                Circle()
                                    .frame(width: 45, height: 45)
                                    .foregroundStyle(Color("iconcolor"))
                                    //.shadow(radius: 20)
                            }
                            .offset(x: -55, y: -75)
                        
                        Text("Tik Tok")
                            .font(.system(size: 15))
                            .foregroundStyle(Color(.darkGray))
                            .offset(x: -55, y: 45)
                        
                        Spacer()
                        
                        Text("-$12")
                            .font(.system(size: 37))
                            .foregroundStyle(.black)
                            .offset(x: -40, y: 85)
                    }
                    
                    ZStack {
                        Rectangle()
                            .cornerRadius(15)
                            .frame(width: 180, height: 230)
                        
                        Image("github")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .background() {
                                Circle()
                                    .frame(width: 45, height: 45)
                                    .foregroundStyle(Color("iconcolor"))
                                    //.shadow(radius: 20)
                            }
                            .offset(x: -55, y: -75)
                        
                        Text("Github")
                            .font(.system(size: 15))
                            .foregroundStyle(Color(.darkGray))
                            .offset(x: -55, y: 45)
                        
                        Spacer()
                        
                        Text("-$24")
                            .font(.system(size: 37))
                            .foregroundStyle(.black)
                            .offset(x: -40, y: 85)
                    }
//                }
            }
            .offset(y: 0)
            .foregroundStyle(Color("Color2").opacity(20.2))
            
            HStack {
                Text("All Time:")
                    .font(.system(size: 19))
                    .foregroundStyle(Color(.darkGray))
                
                Spacer()
                
                Text("-$1,192")
                    .font(.system(size: 27))
                    .foregroundStyle(.black)
            }
            .padding()
            
        }
        .background(Color("Color2")).opacity(90)
            .ignoresSafeArea()
    }
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 49) {
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
}

#Preview {
    PopularCostsView()
}
