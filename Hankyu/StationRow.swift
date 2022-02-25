//
//  StationRow.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import SwiftUI

struct StationRow: View {
    var station: Station
    
    var body: some View {
        
        HStack(spacing: 15) {
            StationNumberView(station: station)
            VStack(alignment: .leading) {
                Text(station.name)
                    .bold()
                Text(station.nameEnglish)
                    .font(.caption)
            }
            Spacer()
            if station.isFavorite {
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.pink)
            }
            
        }
        .padding()
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        
        let stations = ModelData().stations
        
        StationRow(station: stations[0])
            .previewLayout(.fixed(width: 300, height: 50))
        StationRow(station: stations[1])
            .previewLayout(.fixed(width: 300, height: 50))
        StationRow(station: stations[2])
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
