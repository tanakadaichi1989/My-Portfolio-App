//
//  LineTabView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/28.
//

import SwiftUI
import MapKit

struct LineTabView: View {
    
    @Binding var selection: Line
    var geometrySize: CGSize
    
    var body: some View {
        HStack(spacing: .zero) {
            ForEach(Line.allCases,id: \.self){ line in
                VStack {
                    Button {
                        self.selection = line
                        print("\(line.getLineName())を選択しました")
                    } label: {
                        Text("\(line.getLineName())")
                            .font(.body)
                            .fontWeight(.heavy)
                            .foregroundColor(self.selection == line ? line.getLineColor() : .gray)
                    }
                    .frame(width: geometrySize.width /  CGFloat(Line.allCases.count), height: 25)
                    
                    Rectangle()
                        .fill(self.selection == line ? line.getLineColor() : .gray)
                        .frame(width: geometrySize.width / CGFloat(Line.allCases.count), height: 2)
                }
                
            }
        }
    }
}

struct LineTabView_Previews: PreviewProvider {
    static var geometry: CGSize = CGSize(width: 200, height: 44)
    static var previews: some View {
        LineTabView(selection: .constant(.Takarazuka), geometrySize: geometry)
    }
}
