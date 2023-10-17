//
//  TabBarView.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 17/10/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationStack {
                catView
            }
            .tabItem {
                Label("Cats", systemImage: "list.dash")
            }
        }
    }
    
    private var catView: some View {
        let service = RandomCatServiceImpl(networkManager: DefaultNetworkManager())
        let viewModel = CatViewModel(service: service)
        let view = CatView(viewModel: viewModel)
        return view
        
    }
}

#Preview {
    TabBarView()
}
