//
//  StationName.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import SwiftUI

struct StationNameView: View {
    var station: Station
    
    var body: some View {
        VStack {
            Text(station.name)
                .font(.largeTitle)
                .bold()
            Text(station.nameEnglish)
                .font(.subheadline)
        }
    }
}

struct StationName_Previews: PreviewProvider {
    static var previews: some View {
        let stations = ModelData().stations
        StationNameView(station: stations[0])
    }
}
