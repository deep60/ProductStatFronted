//
//  StockProductView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 18/08/24.
//

import SwiftUI

struct StockProductView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Color6").background()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("Stock \nProduct")
                        //.font(.title.bold())
                            .font(.system(size: 29))
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .font(.title3)
                            .foregroundStyle(.black)
                    }
                    .padding()
                    
                    Spacer()
                    
                    RotationCircleView()
                    
                    HStack {
                        Text("Delivered")
                            .foregroundStyle(Color.gray)
                        
                        Spacer()
                        
                        Text("100-200")
                            .font(.system(size: 25))
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    StockProductView()
}

struct RotationCircleView: View {
    @State var angle: Double = 0
    
    var body: some View {
        ZStack {
            ZStack {
                ForEach(0..<12) { index in
                    Circle()
                        .fill(Color(.gray))
                        .offset(x: 150)
                        .frame(width: 70, height: 70)
                        .rotationEffect(Angle(degrees: Double(index) / 12.0 * 360))
                        .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)))
                        .rotationEffect(Angle(degrees: angle))
                }
            }
            
            
            ZStack {
                ForEach(0..<6) { index in
                    Circle()
                        .fill(Color(.black))
                        .frame(width: 60, height: 60)
                        .offset(x: 75)
                        .rotationEffect(Angle(degrees: Double(index) / 6 * 360))
                        .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)))
                        .rotationEffect(Angle(degrees: -angle))
                }
            }
            
            Circle()
                .frame(width: 60, height: 60)
        }
        .offset(y: -200)
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
