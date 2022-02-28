//
//  StationDetail.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/23.
//

import SwiftUI

struct StationDetail: View {
    @EnvironmentObject var modelData: ModelData
    var station: Station
    
    var stationIndex: Int {
        $modelData.stations.firstIndex(where: { $0.id == station.id})!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: station.getLocation())
                .frame(height: 300)
            HStack(spacing: 10) {
                StationNumberView(station: station, size: 50)
                StationNameView(station: station)
                LikeButton(isSet: $modelData.stations[stationIndex].isFavorite,size: 30)
                    .frame(width: 50, height: 50)
            }
            NeighborStationView(station: station)
            Spacer()
            
        }
    }
}

struct StationDetail_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        //StationDetail(station: ModelData().stations[0])
            //.environmentObject(modelData)
        StationDetail(station: ModelData().stations[7])
            .environmentObject(modelData)
    }
}
