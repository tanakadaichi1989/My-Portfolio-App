//
//  PreviousStationView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/25.
//

import SwiftUI

struct PreviousStationView: View {
    @EnvironmentObject var modelData:ModelData
    var station: Station
    
    var body: some View {
        
        if let previousStation = station.getPreviousStation() {
            HStack {
                StationNumberView(station: previousStation, size: 20)
                VStack {
                    Text(previousStation.name)
                        .font(.system(size: 12))
                        .bold()
                    Text(previousStation.nameEnglish)
                        .font(.system(size: 8))
                }
                Image(systemName: "chevron.right.2")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct PreviousStationView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousStationView(station: ModelData().stations[7])
    }
}
