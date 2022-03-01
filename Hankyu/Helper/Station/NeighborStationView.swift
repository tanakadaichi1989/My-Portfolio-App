//
//  NeighborStationView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/25.
//

import SwiftUI

struct NeighborStationView: View {
    var station: Station
    var body: some View {
        HStack{
            NextStationView(station: station)
            Spacer()
            PreviousStationView(station: station)
        }
        .padding()
    }
}

struct NeighborStationView_Previews: PreviewProvider {
    static var previews: some View {
        NeighborStationView(station: ModelData().stations[7])
    }
}
