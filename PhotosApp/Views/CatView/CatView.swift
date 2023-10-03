//
//  CatView.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import SwiftUI

struct CatView: View {
    @ObservedObject var viewModel: CatViewModel
    
    var body: some View {
        ScrollView {
            catImages
        }
        .navigationTitle("Cats")
        .overlay {
            if viewModel.randomCat.isEmpty {
                ContentUnavailableView.init("No Cats!!", systemImage: "wifi.slash")
            }
        }
        .task {
            await viewModel.getRandomCat()
        }
    }
    
    private var catImages: some View {
        ForEach($viewModel.randomCat) {
            
            AsyncImage(url: $0.url.wrappedValue) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ZStack {
                            Color.gray
                            Image(systemName: "photo.fill")
                        }
                        .frame(width: 250, height: 250)
                       
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 24.0))
                    .padding(.horizontal, 24.0)
            
        }
       
    }

}

#Preview {
    CatView(viewModel: .preview)
}
