//
//  ModelData.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var stations: [Station] = load("Station_Takarazuka.json") + load("Station_Kobe.json") + load("Station_Kyoto.json")
    @Published var spots: [Spot] = load("Spot.json")
    
    var features: [Spot] {
        spots.filter { $0.isFeatured }
    }
    
    var spotsByLine: [Line:[Spot]] {
        Dictionary(
            grouping: spots,
            by: { $0.line }
        )
    }
    
    func getStation(from stationID: String) -> Station? {
        guard let station = stations.first(where: { $0.id == stationID }) else { return nil }
        return station
    }
    
    func countLikeStation(by line:Line) -> Int {
        stations.filter { $0.line == line }.count
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


func fetchAPI<T: Decodable>(_ address: String) -> T {
    var result: Data = Data()
    
    guard let url = URL(string: address) else {
        fatalError("Couldn't find address \(address)")
    }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request, completionHandler: {(data,response,error) in
        if let unwrappedData = data {
            result = unwrappedData
        }
    })
    .resume()
    
    do {
        let decoder = JSONDecoder()
        print(try decoder.decode(T.self, from: result))
        return try decoder.decode(T.self, from: result)
    } catch {
        fatalError("Couldn't parse \(address) as \(T.self):\n\(error)")
    }
}
