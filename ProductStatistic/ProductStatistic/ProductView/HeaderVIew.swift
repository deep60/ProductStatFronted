//
//  HeaderVIew.swift
//  ProductStatistic
//
//  Created by P Deepanshu on 12/08/24.
//

import SwiftUI

struct HeaderVIew: View {
    let name: String = "Product \nStatistics"
    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemGray4).background()
                .ignoresSafeArea()
            HStack {
                Text(name)
                    //.font(.title.bold())
                    .font(.system(size: 35))
                    .fontWeight(.heavy)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .font(.title3)
                    .foregroundStyle(.black)
            }
            .padding()
        }
    }
}

#Preview {
    HeaderVIew()
}
