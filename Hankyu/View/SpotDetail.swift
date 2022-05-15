//
//  SpotDetail.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/04/16.
//

import SwiftUI

struct SpotDetail: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    
    var spot: Spot
    
    var spotIndex: Int {
        $modelData.spots.firstIndex(where: { $0.id == spot.id})!
    }
    
    var nearStation: Station {
        modelData.stations.filter { $0.id == spot.nearStationID }.first!
    }
    
    var body: some View {
        
        ScrollView {
            
            Image(spot.imageURL ?? "photo")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(height: 300)
            
            HStack {
            Text(spot.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            LikeButton(isSet: $modelData.spots[spotIndex].isFavorite,size: 30)
                .frame(width: 50, height: 50)
            }
            .padding()
            
            HStack {
                StationNumberView(station: nearStation)
                Text("\(nearStation.name)駅 \(spot.subinformation)")
            }
            .padding()
            
            Text(spot.description)
                .padding()
            
            MapView(coordinate: spot.getLocation())
                .frame(height: 300)
        
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("閉じる")
            })
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}
