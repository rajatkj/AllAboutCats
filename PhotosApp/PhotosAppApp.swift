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
