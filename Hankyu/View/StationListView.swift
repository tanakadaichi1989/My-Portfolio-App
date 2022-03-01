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
    @State private var selection: Line = .Takarazuka

    var filteredStations: [Station] {
        modelData.stations.filter { station in
            (!showFavoriteOnly || station.isFavorite) && station.line == selection
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(spacing: .zero) {
                    LineTabView(selection: $selection, geometrySize: geometry.size)
                    
                    List{
                        Toggle(isOn: $showFavoriteOnly){
                            Text("お気に入りのみ表示")
                        }
                        
                        ForEach(filteredStations) { station in
                            NavigationLink {
                                StationDetail(station: station)
                            } label: {
                                StationRow(station: station)
                            }
                        }
                    }
                    Spacer()
                }
                .navigationBarTitle("駅一覧",displayMode: .inline)
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView()
            .environmentObject(ModelData())
    }
}
