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
            catImage
        }
        .task {
            await viewModel.getRandomCat()
        }
    }
    
    private var catImage: some View {
        ForEach($viewModel.randomCat) {
            AsyncImage(url: $0.url.wrappedValue)
        }
       
    }

}

#Preview {
    CatView(viewModel: .preview)
}
