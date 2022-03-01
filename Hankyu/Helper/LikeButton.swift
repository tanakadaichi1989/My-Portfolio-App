//
//  LikeButton.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/25.
//

import SwiftUI

struct LikeButton: View {
    @Binding var isSet: Bool
    var size: CGFloat
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Like Button", systemImage:  isSet ? "heart.fill" : "heart")
                .font(Font.system(size: size))
                .labelStyle(.iconOnly)
                .foregroundColor(.pink)
        }
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(isSet: Binding.constant(true), size: 30)
    }
}
