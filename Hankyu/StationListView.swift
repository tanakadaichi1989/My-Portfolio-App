//
//  StationListView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/23.
//

import SwiftUI

struct StationListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredStations: [Station] {
        modelData.stations.filter { station in
            (!showFavoriteOnly || station.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoriteOnly){
                    Text("お気に入りのみ表示")
                }
                
                ForEach(filteredStations){ station in
                    NavigationLink {
                        StationDetail(station: station)
                    } label: {
                        StationRow(station: station)
                    }
                }
            }
            .navigationTitle("阪急神戸線")
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView()
            .environmentObject(ModelData())
    }
}
