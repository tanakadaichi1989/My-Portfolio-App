//
//  SpotRow.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/01.
//

import SwiftUI

struct SpotRow: View {
    @EnvironmentObject private var modelData: ModelData
    @State var showSpotDetail = false
    var line: Line
    var spots: [Spot]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Rectangle()
                    .frame(width: 5, height: 50)
                    .foregroundColor(line.getLineColor())
                Text(line.getLineName())
                    .font(.title2)
                    .fontWeight(.heavy)
                    .frame(width: 80,alignment: .leading)
                StationNumberView(station: modelData.stations.filter { $0.line == line }.first!)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                StationNumberView(station: modelData.stations.filter { $0.line == line }.last!)
            }
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(spots,id:\.self){ spot in
                        Button(action: {
                            self.showSpotDetail.toggle()
                        }, label: {
                            SpotItem(spot: spot)
                        })
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
            .environmentObject(ModelData())
    }
}
