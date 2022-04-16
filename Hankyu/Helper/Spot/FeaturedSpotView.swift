//
//  FeaturedSpotView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/04/16.
//

import SwiftUI

struct FeaturedSpotView: View {
    var spot: Spot
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Image("Shukugawa")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(height: 200)
                LinearGradient(gradient: Gradient(colors: [.black.opacity(0), .black.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 60)
                VStack(alignment: .leading) {
                    Text("特集 沿線のお花見スポット")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(10)
                }
            }
        }
    }
}

struct FeaturedSpotView_Previews: PreviewProvider {
    static var spot = ModelData().features[0]
    static var previews: some View {
        FeaturedSpotView(spot: spot)
    }
}
