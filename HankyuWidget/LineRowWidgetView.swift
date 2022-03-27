//
//  LineRowWidgetView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/27.
//

import SwiftUI

struct LineRowWidgetView: View {
    var line: Line
    var stations: [Station]

    var body: some View {
        HStack {
            Rectangle()
                .fill(line.getLineColor())
                .frame(width: 5.0, height: 16.0)
            Text(line.getLineName())
                .fontWeight(.heavy)
            Image(systemName: "heart.fill")
                .foregroundColor(.pink)
            Text("\(stations.filter { $0.isFavorite == true }.count)")
                .fontWeight(.heavy)
        }
    }
}

struct LineRowWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LineRowWidgetView(line: Line.Takarazuka, stations: [])
    }
}
