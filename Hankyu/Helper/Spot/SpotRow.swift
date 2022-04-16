//
//  SpotRow.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/01.
//

import SwiftUI

struct SpotRow: View {
    @EnvironmentObject private var modelData: ModelData
    var line: Line
    var spots: [Spot]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Rectangle()
                    .frame(width: 5, height: 50)
                    .foregroundColor(line.getLineColor())
                Text(line.getLineName())
                    .fontWeight(.heavy)
                StationNumberView(station: modelData.stations.filter { $0.line == line }.first!)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                StationNumberView(station: modelData.stations.filter { $0.line == line }.last!)
            }
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(spots,id:\.self){ spot in
                        SpotItem(spot: spot)
                    }
                }
            }
        }
        .padding()
    }
}


struct SpotRow_Previews: PreviewProvider {
    static var spots = ModelData().spotsByLine
    static var previews: some View {
        SpotRow(line: .Kobe, spots: spots[.Kobe]!)
    }
}
