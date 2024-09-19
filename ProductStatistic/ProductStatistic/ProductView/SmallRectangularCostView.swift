//
//  SmallRectangularCostView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 13/08/24.
//

import SwiftUI

struct SmallRectangularCostView: View {
    
    let data = [50, 100, 40, 20, 60]
    @State var currentDate: Date = .init()
    @State var weekSlider: [Date.WeekDay] = []
    @State var currentWeekIndex: Int = 0
    @State var isActive = false
    
    var body: some View {
        ZStack {
            Color(.systemGray4).background()
                .ignoresSafeArea()
            ZStack {
                Rectangle()
                    .frame(width: 250, height: 280)
                    .foregroundStyle(Color("Color2"))
                    .cornerRadius(15)
                
                Text("Popular \nCosts")
                    .font(.system(size: 20, weight: .heavy))
                    .offset(x: -80, y: -105)
                
                HStack(alignment: .bottom, spacing: 5) {
                    ForEach(data, id: \.self) { value in
                        Rectangle()
                            .frame(width: 35, height: CGFloat(value))
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.top, 10)
                
                HStack() {
                    WeekShowView()
                }
                .padding(.top, 180)
            }
            .offset(x: -60, y: -40)
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 110, height: 180)
                        .cornerRadius(16)
                        .foregroundStyle(Color(.systemGray5))
                    
                    Text("45%")
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                        .offset(y: -65)
                    
                    
                    Rectangle()
                        .frame(width: 100, height: 80)
                        .foregroundStyle(Color("Color3"))
                        .cornerRadius(10)
                        .offset(y: 45)
                }
                .offset(x: 130, y: -90)
            }
            
            ZStack {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
                    .font(.system(size: 22))
                    .background() {
                        Circle()
                            .frame(width: 110, height: 90)
                            .foregroundStyle(Color(.systemGray2).opacity(0.8))
                    }
            }
            .offset(x: 130, y: 50)
            
            ZStack() {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.callout)
                        .foregroundStyle(.black)
                    
                    Spacer(minLength: 1)
                    
                    Text("Today¹⁹")
                        .font(.system(size: 19))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("Yesterday⁵³")
                        .font(.system(size: 19))
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                }
                .padding()
            }
            .offset(y: 130)
        }
    }
    
    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}

#Preview {
    SmallRectangularCostView()
}



