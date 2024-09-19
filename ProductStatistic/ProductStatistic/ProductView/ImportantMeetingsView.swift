//
//  ImportantMeetingsView.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 17/08/24.
//

import SwiftUI

struct ImportantMeetingsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Color5").background()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("Important \nMeetings")
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
                    
                    VStack(spacing: 5) { // 7 rows
                        ForEach(0..<8, id: \.self) { _ in
                            HStack() { // 9 columns
                                ForEach(0..<7, id: \.self) { _ in
                                    Circle()
                                        .fill(randomColor())
                                        .frame(width: 45, height: 40)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
    func randomColor() -> Color {
        return Bool.random() ? .gray : .black.opacity(0.5)
        }
    
//    func randomColor() -> Color {
//            let randomValue = Double.random(in: 0...1)
//            switch randomValue {
//            case 0...0.15:
//                return .black
//            case 0.15...0.30:
//                return .gray
//            default:
//                return Color(
//                    red: Double.random(in: 0...1),
//                    green: Double.random(in: 0...1),
//                    blue: Double.random(in: 0...1)
//                )
//            }
//        }
}

#Preview {
    ImportantMeetingsView()
}
