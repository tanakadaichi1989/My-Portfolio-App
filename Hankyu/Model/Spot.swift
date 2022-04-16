//
//  Spot.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/01.
//

import Foundation

struct Spot: Hashable, Decodable, Identifiable {
    var id: String
    var name: String
    var imageURL: String?
    var line: Line
    var nearStationID: String
    var isFeatured: Bool
}

