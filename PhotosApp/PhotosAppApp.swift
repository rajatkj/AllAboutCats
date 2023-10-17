//
//  PhotosAppApp.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import SwiftUI

@main
struct PhotosAppApp: App {
    let initialView: CatView
    
    init() {
        URLCache.shared.memoryCapacity = 10_000_000
        URLCache.shared.diskCapacity = 1_000_000_000
        
        let service = RandomCatServiceImpl(networkManager: DefaultNetworkManager())
        let viewModel = CatViewModel(service: service)
        let view = CatView(viewModel: viewModel)
        initialView = view
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                initialView
            }
        }
    }
}
