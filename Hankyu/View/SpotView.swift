//
//  SpotView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/01.
//

import SwiftUI

// お出かけ情報
// Article
// Spot
struct SpotView: View {
    
    @State private var isOn = true
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
            VStack {
                Text("特集")
                ForEach(Line.allCases,id: \.self){ line in
                    Text("\(line.getLineName()) おすすめ")
                }
            }
            .navigationTitle("おでかけスポット")
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct SpotView_Previews: PreviewProvider {
    static var previews: some View {
        SpotView()
    }
}
