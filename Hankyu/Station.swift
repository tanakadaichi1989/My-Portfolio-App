//
//  Station.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import Foundation
import SwiftUI
import MapKit

struct Station: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var nameEnglish: String
    var latitude: String
    var longitude: String
    var isFavorite: Bool
    
    func getLatitude() -> CLLocationDegrees {
        return CLLocationDegrees(Double(latitude) ?? 35.000)
    }
    
    func getLongitude() -> CLLocationDegrees {
        return CLLocationDegrees(Double(longitude) ?? 135.00)
    }
    
    func getLocation() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.getLatitude(), longitude: self.getLongitude())
    }
    
    func getNextStation() -> Station? {
        let stations = ModelData().stations
        
        guard let currentStationIndex = stations.firstIndex(where: { $0.id == self.id}) else { return nil }
        
        let nextStationIndex = currentStationIndex + 1
        
        guard nextStationIndex < stations.count else { return nil }
        
        return stations[nextStationIndex]
    }
    
    func getPreviousStation() -> Station? {
        let stations = ModelData().stations
        
        guard let currentStationIndex = stations.firstIndex(where: { $0.id == self.id}) else { return nil }
        
        let previousStationIndex = currentStationIndex - 1
        
        guard previousStationIndex >= 0 else { return nil }
        
        return stations[previousStationIndex]
    }
    
}
