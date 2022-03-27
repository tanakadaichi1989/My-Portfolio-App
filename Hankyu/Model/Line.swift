//
//  Line.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/26.
//

import Foundation
import SwiftUI

enum Line: String, Codable, CaseIterable {
    case Takarazuka = "Takarazuka"
    case Kobe = "Kobe"
    case Kyoto = "Kyoto"
    
    func getLineColor() -> Color {
        switch self {
        case .Takarazuka: return .orange
        case .Kobe: return .blue
        case .Kyoto: return .green
        }
    }
    
    func getLineName() -> String {
        switch self {
        case .Takarazuka: return "宝塚線"
        case .Kobe: return "神戸線"
        case .Kyoto: return "京都線"
        }
    }
    
    func getLineNameEnglish() -> String {
        "\(self.rawValue) Line"
    }
    
    func getLineFrom(station: Station) -> Line {
        station.line
    }
}
