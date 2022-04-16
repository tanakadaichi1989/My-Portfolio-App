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
            ZStack {
            Rectangle()
                .frame(height: 200)
                .foregroundColor(.gray)
            Text("特集 - 沿線のお花見スポット")
                    .fontWeight(.black)
                    .foregroundColor(.white)
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
