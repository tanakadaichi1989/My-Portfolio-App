//
//  StationNumber.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import SwiftUI

struct StationNumberView: View {
    @State private var hk = "HK"
    var stationNumber:Int
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(.blue, lineWidth: 3)
                .frame(width: 30, height: 30)
            VStack {
                Text(hk)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.blue)
                    .font(.system(size: 7, weight: .black, design: .default))
                Text(String(stationNumber))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.blue)
                    .font(.system(size: 10, weight: .black, design: .default))
            }

        }
    }
}

struct StationNumber_Previews: PreviewProvider {
    static var previews: some View {
        StationNumberView(stationNumber: 01)
    }
}
