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
    
    var spotIndex: Int? {
        $modelData.spots.firstIndex(where: { $0.nearStationID.wrappedValue == station.id })
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            MapView(coordinate: station.getLocation())
                .frame(height: 300)
            
            HStack(spacing: 10) {
                StationNumberView(station: station, size: 50)
                StationNameView(station: station)
                LikeButton(isSet: $modelData.stations[stationIndex].isFavorite,size: 30)
                    .frame(width: 50, height: 50)
            }
            
            NeighborStationView(station: station)
                .padding(10)
            
            Spacer()
            
            if let unwrappedSpotIndex = spotIndex {
                VStack(alignment: .center){
                    Text("近くのおすすめスポット")
                        .fontWeight(.semibold)
                    NavigationLink {
                        SpotDetail(spot: modelData.spots[unwrappedSpotIndex])
                    } label: {
                        SpotItem(spot: modelData.spots[unwrappedSpotIndex])
                    }
                    Text("この駅\(modelData.spots[unwrappedSpotIndex].subinformation)")
                }
            }
            
            Spacer()
            
        }
    }
}

