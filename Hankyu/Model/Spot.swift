//
//  Spot.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/03/01.
//

import Foundation
import MapKit

struct Spot: Hashable, Decodable, Identifiable {
    var id: String
    var name: String
    var imageURL: String?
    var line: Line
    var nearStationID: String
    var description: String
    var subinformation: String
    var latitude: String
    var longitude: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    func getLatitude() -> CLLocationDegrees {
        return CLLocationDegrees(Double(latitude) ?? 35.000)
    }
    
    func getLongitude() -> CLLocationDegrees {
        return CLLocationDegrees(Double(longitude) ?? 135.00)
    }
    
    func getLocation() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.getLatitude(), longitude: self.getLongitude())
    }
}

