//
//  LineWidgetView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/27.
//

import SwiftUI

struct LineWidgetView: View {
    var stations: [Station]
    
    var body: some View {
        VStack {
            ForEach(Line.allCases,id: \.self){ line in
                LineRowWidgetView(line: line,stations: stations.filter { $0.line == line })
            }
        }
    }
}

struct LineWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LineWidgetView(stations: [])
    }
}
