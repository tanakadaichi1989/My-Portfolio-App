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
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var  modelData: ModelData
    
    var featuredSpot: Spot {
        modelData.features[0]
    }

    var body: some View {
        GeometryReader { geometry in

                List {
                    FeaturedSpotView(spot: featuredSpot)
                        .scaledToFill()
                        .clipped()
                        .listRowInsets(EdgeInsets())
                    ForEach(Line.allCases,id: \.self){ line in
                        SpotRow(line: line,spots: modelData.spotsByLine[line]!)
                    }
                    .listRowInsets(EdgeInsets())
                }

            }
        }
}

struct SpotView_Previews: PreviewProvider {
    static var modelView = ModelData()
    static var previews: some View {
        SpotView()
            .environmentObject(ModelData())
    }
}
