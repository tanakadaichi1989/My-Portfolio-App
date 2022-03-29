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
    @EnvironmentObject var  modelData: ModelData

   // テストコードを書く
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Text("特集")
                    ForEach(Line.allCases,id: \.self){ line in
                        VStack {
                            Text("\(line.getLineName()) おすすめ")
                            SpotRow(spot: modelData.spots[0])
                        }
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
