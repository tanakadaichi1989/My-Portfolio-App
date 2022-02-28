//
//  StationNumber.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import SwiftUI

struct StationNumberView: View {

    var station: Station
    var size: CGFloat = 30
    
    var body: some View {
        
        ZStack{
            Circle()
                .stroke(station.line.getLineColor(), lineWidth: size * 0.1)
                .frame(width: size, height: size)
            VStack {
                Text("HK")
                    .fontWeight(.heavy)
                    .foregroundColor(station.line.getLineColor())
                    .font(.system(size: size * 0.3, weight: .black, design: .default))
                Text(station.numbering)
                    .fontWeight(.heavy)
                    .foregroundColor(station.line.getLineColor())
                    .font(.system(size: size * 0.4, weight: .black, design: .default))
            }

        }
    }
    
}

struct StationNumber_Previews: PreviewProvider {
    static var previews: some View {
        let stations = ModelData().stations
        StationNumberView(station: stations[0], size: 30)
    }
}
