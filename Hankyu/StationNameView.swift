//
//  StationName.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import SwiftUI

struct StationNameView: View {
    var stationName: String
    @State private var stationNameEnglish = "Osaka-umeda"
    
    var body: some View {
        VStack {
            Text(stationName)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text(stationNameEnglish)
                .font(.subheadline)
        }
    }
}

struct StationName_Previews: PreviewProvider {
    static var previews: some View {
        StationNameView(stationName: "駅名")
    }
}
