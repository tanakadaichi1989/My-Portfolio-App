//
//  HankyuApp.swift
//  Hankyu
//
//  Created by 田中大地 on 2022/02/22.
//

import SwiftUI


@main
struct HankyuApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
