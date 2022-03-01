//
//  ContentView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Tab = .spot
    
    enum Tab {
        case spot
        case stationList
    }
    
    var body: some View {
        TabView(selection: $selection){
            SpotView()
                .tabItem {
                    Label("おでかけスポット",systemImage: "figure.walk")
                }
                .tag(Tab.spot)
            StationListView()
                .tabItem {
                    Label("駅情報",systemImage: "tram")
                }
                .tag(Tab.stationList)
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
