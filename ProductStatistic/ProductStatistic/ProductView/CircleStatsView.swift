//
//  CircleStatsView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 12/08/24.
//

import SwiftUI

struct CircleStatsView: View {
    
    @State var angle: Double = 0
    
    var body: some View {
        ZStack(alignment: .center) {
            Color(.systemGray4).background()
                .ignoresSafeArea()
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 65))
                .frame(width: 230, height: 230)
                .foregroundStyle(Color(.white))
            
            ZStack {
                ForEach(0..<10, id: \.self) { index in
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 20, height: 3)
                        .offset(x: -115)
                        .rotationEffect(.init(degrees: Double(index) * 40))
                }
                .rotationEffect(.init(degrees: -10))
                //.rotationEffect(.init(degrees: angle))
                
                Circle()
                    .fill(Color(.systemOrange))
                    .frame(width: 15, height: 15)
                    .offset(x: -105)
                    .rotationEffect(.init(degrees: angle))
                    .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)))
                    .rotationEffect(.init(degrees: 180))
            }
            
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .frame(width: 165, height: 165)
                    .foregroundStyle(Color(.systemGray6))
                ZStack {
                    VStack {
                        Text("55%")
                            .font(.system(size: 55))
                            .fontWeight(.semibold)
                        
                        Text("Mobile")
                            .font(.subheadline)
                            .foregroundStyle(Color(.lightGray))
                    }
                }
            }
        }
    }
    
    func onChanged(value: DragGesture.Value) {
        let translation = value.location
        let vector = CGVector(dx: translation.x, dy: translation.y)
        let radian = atan2(vector.dy - 10, vector.dx - 10)
        
        var angle = radian * 360 / .pi
        
        if angle < 0 {angle = 360 + angle}
        
        if angle <= 360 {
            self.angle = Double(angle)
        }
    }
}

#Preview {
    CircleStatsView()
}
