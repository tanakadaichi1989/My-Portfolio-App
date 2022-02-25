//
//  NextStationView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/25.
//

import SwiftUI

struct NextStationView: View {
    @EnvironmentObject var modelData:ModelData
    var station: Station
    
    var body: some View {
        if let nextStation = station.getNextStation() {
            HStack {
                Image(systemName: "chevron.left.2")
                    .foregroundColor(.gray)
                StationNumberView(station: nextStation, size: 20)
                VStack {
                    Text(nextStation.name)
                        .font(.system(size: 12))
                        .bold()
                    Text(nextStation.nameEnglish)
                        .font(.system(size: 8))
                }
            }
        }
    }
}

struct NextStationView_Previews: PreviewProvider {
    
    static var previews: some View {
        NextStationView(station: ModelData().stations[7])
    }
}
