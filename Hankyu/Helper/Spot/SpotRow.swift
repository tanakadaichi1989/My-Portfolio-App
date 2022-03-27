//
//  SpotRow.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/01.
//

import SwiftUI

struct SpotRow: View {
    @EnvironmentObject private var modelData: ModelData
    var spot: Spot
    var body: some View {
        VStack {
            Text(spot.name)
            Text(spot.imageURL ?? "画像なし")
            Text(modelData.getStation(from: spot.nearStationID)?.name ?? "")
        }
        .frame(width: 200, height: 100)
        .cornerRadius(5)
    }
}


struct SpotRow_Previews: PreviewProvider {
    static var previews: some View {
        SpotRow(spot: ModelData().spots[0])
    }
}
