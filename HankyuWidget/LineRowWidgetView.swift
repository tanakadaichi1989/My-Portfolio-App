//
//  LineRowWidgetView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/27.
//

import SwiftUI

struct LineRowWidgetView: View {
    var line: Line

    var body: some View {
        HStack {
            Rectangle()
                .fill(line.getLineColor())
                .frame(width: 5.0, height: 16.0)
            Text(line.getLineName())
                .fontWeight(.heavy)
            Image(systemName: "heart.fill")
                .foregroundColor(.pink)
            Text("0")
        }
    }
}

struct LineRowWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LineRowWidgetView(line: Line.Takarazuka)
    }
}
