//
//  MapView.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var stationMap = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $stationMap)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        stationMap = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 35.000_000, longitude: 135.000_000))
    }
}
