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
        VStack(alignment: .leading) {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 150, height: 150)
            Text(spot.name)
        }
    }
}

struct SpotItem_Previews: PreviewProvider {
    static var spot = ModelData().spotsByLine[.Kobe]![0]
    static var previews: some View {
        SpotItem(spot: spot)
    }
}
