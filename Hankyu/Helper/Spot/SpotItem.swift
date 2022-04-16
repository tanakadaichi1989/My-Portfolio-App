//
//  SpotItem.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/04/16.
//

import SwiftUI

struct SpotItem: View {
    @EnvironmentObject var modelData: ModelData
    var spot: Spot
    var body: some View {
        
        VStack(alignment: .center) {
            Image(spot.imageURL ?? "photo")
                .resizable()
                .clipped()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .cornerRadius(5)
                .padding(5)
            Text(spot.name)
                .foregroundColor(.black)
                .padding(5)
        }
    } 
}

struct SpotItem_Previews: PreviewProvider {
    static var spot = ModelData().spotsByLine[.Kobe]![0]
    static var previews: some View {
        SpotItem(spot: spot)
    }
}
