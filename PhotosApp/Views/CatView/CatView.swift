//
//  CatView.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import SwiftUI

struct CatView: View {
    @ObservedObject var viewModel: CatViewModel
    @State private var searchIsActive = false

    var body: some View {
        
        ScrollView {
            catList
        }
        .navigationTitle("Cats")
        .overlay {
            if viewModel.breeds.isEmpty {
                ContentUnavailableView.init("No Cats!!", systemImage: "wifi.slash")
            }
        }
        .task {
            if viewModel.breeds.isEmpty {
                await viewModel.getAllBreeds()
            }
        }
        .searchable(text: $viewModel.searchText, isPresented: $searchIsActive, prompt: "Meow?")
    }
    
    private var catList: some View {
        ForEach(searchIsActive ? viewModel.searchResults : viewModel.breeds) { breed in
            NavigationLink {
                BreedDetailView(breed: breed)
            } label: {
                CardView(breed: breed)
            }
        }
    }
    
}

#Preview {
    CatView(viewModel: .preview)
}
