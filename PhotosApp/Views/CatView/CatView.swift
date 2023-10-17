//
//  CatView.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import SwiftUI

struct CatView: View {
    @ObservedObject var viewModel: CatViewModel
    
    @State private var showDetail = false
    
    var body: some View {
        
        ScrollView {
            catImages
        }
        .task {
            await viewModel.getRandomCat()
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
        
    }
    
    private var catImages: some View {
        ForEach(viewModel.breeds) { breed in
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
