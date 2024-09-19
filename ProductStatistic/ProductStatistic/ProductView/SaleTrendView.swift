//
//  SaleTrendView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 18/08/24.
//

import SwiftUI

struct SaleTrendView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Color7").background()
                    .ignoresSafeArea()
                ScrollView {
                    SaleView()
                }
            }
        }
    }
}

#Preview {
    SaleTrendView()
}

struct Wave: Shape {
    
    var progress: CGFloat
    var waveHeight: CGFloat
    var offset: CGFloat
    var animatableData: CGFloat {
        get{offset}
        set{offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: .zero)
            let progressHeight: CGFloat = (1 - progress) * rect.height
            let height = waveHeight * rect.height
            
            for value in stride(from: 0, to: rect.width, by: 2) {
                let x: CGFloat = value
                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)
                let y: CGFloat = progressHeight + (height * sine)
                
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}

struct SaleView: View {
    @State private var productFillAmount: CGFloat = 0.0
    @State private var serviceFillAmount: CGFloat = 0.0
    var body: some View {
        VStack {
            HStack {
                Text("Sales \nTrend")
                    .font(.system(size: 29))
                    .fontWeight(.heavy)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .font(.title3)
                    .foregroundStyle(.black)
            }
            .padding()
            
            Spacer()
                .frame(height: 250)
            
            HStack(spacing: 20) {
                //                        GeometryReader { proxy in
                //                            let size = proxy.size
                //                            ZStack {
                //                                Rectangle()
                //                                    .cornerRadius(34)
                //                                    .frame(width: 180, height: 400)
                //                                    .foregroundStyle(.black)
                //                                    .scaleEffect(x: 1.1, y: 1.1)
                //                                    .offset(y: -13)
                //
                //                                Wave(progress: 1, waveHeight: 0.1, offset: size.width)
                //                                    .foregroundStyle(Color("Color7"))
                //                                    .mask {
                //                                        Rectangle()
                //                                            .cornerRadius(34)
                //                                            .frame(width: 150, height: 400)
                //                                            .padding(20)
                //                                    }
                //
                //                            }
                //                        }
                
                VStack {
                    ZStack(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.black.opacity(0.3))
                            .frame(width: 150, height: 400)
                        
                        RoundedRectangle(cornerRadius: 28)
                            .frame(width: 150, height: 400 * serviceFillAmount)
                            .foregroundStyle(Color(.white))
                        
                        
                        Text("\(Int(serviceFillAmount * 100))%")
                            .foregroundStyle(Color(.black))
                            .font(.largeTitle)
                            .bold()
                            .offset(y: -340 * (serviceFillAmount))
                        
                        Text("Services")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                    }
                }
                
                VStack {
                    ZStack(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.black.opacity(0.3))
                            .frame(width: 150, height: 400)
                        
                        RoundedRectangle(cornerRadius: 28)
                            .frame(width: 150, height: 400 * productFillAmount)
                            .foregroundStyle(Color(.white))
                        
                        
                        Text("\(Int(productFillAmount * 100))%")
                            .foregroundStyle(Color(.black))
                            .font(.largeTitle)
                            .bold()
                            .offset(y: -250 * (productFillAmount))
                        
                        Text("Products")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                    }
                }
                
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 3)) {
                    serviceFillAmount = 0.7
                    productFillAmount = 0.4
                }
            }
            .padding()
        }
        
    }
}
