//
//  LineWidgetView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/27.
//

import SwiftUI

struct LineWidgetView: View {
    
    var body: some View {
        VStack {
            ForEach(Line.allCases,id: \.self){ line in
                LineRowWidgetView(line: line)
            }
        }
    }
}

struct LineWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LineWidgetView()
    }
}
