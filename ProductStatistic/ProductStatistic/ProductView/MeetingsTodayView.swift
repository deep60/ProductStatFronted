//
//  MeetingsTodayView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 19/08/24.
//

import SwiftUI

struct MeetingsTodayView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Color8").background()
                    .ignoresSafeArea()
                ScrollView {
                    MeetingsView()
                }
            }
        }
    }
}

#Preview {
    MeetingsTodayView()
}

struct CircleProgressView: View {
    
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, .gray]), center: .center, startRadius: 5, endRadius: 50)
                .scaleEffect(0.1)
            Circle()
                .foregroundStyle(Color(.black).opacity(0.9))
                .frame(width: 100, height: 100)
                //.stroke(Color.gray.opacity(0.5), lineWidth: 20)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .foregroundStyle(Color(.systemGray).opacity(0.5))
                .rotationEffect(Angle(degrees: -90))
                //.animation(Animation.easeInOut(duration: 5).delay(0.99).repeatForever(autoreverses: false))
//                .onAppear() {
//                        self.toggle()
//                    }

        }
    }
}

struct MeetingsView: View {
    @State private var rotate2D = false
    @State private var progressValues: [Double] = [0.2, 0.5, 0.75, 0.3, 0.6, 0.4, 0.8, 0.7, 0.4]
    var body: some View {
        VStack {
            HStack {
                Text("Meetings \nToday")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "chevron.down")
                    .font(.title3)
                    .foregroundStyle(.black)
            }
            .padding()
            
            Spacer()
                .frame(height: 250)
            
            VStack {
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
                
                LazyVGrid(columns: columns, spacing: 35) {
                    ForEach(0..<9) { index in
                        CircleProgressView(progress: $progressValues[index])
                            .frame(width: 100, height: 100)
                    }
                }
                .padding(.horizontal, 2)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 8).delay(0.99).repeatForever(autoreverses: false)) {
                    progressValues = [0.6, 0.6, 0.5, 0.4, 0.6, 0.4, 0.5, 0.7, 0.4]
                }
            }
        }
    }
}
