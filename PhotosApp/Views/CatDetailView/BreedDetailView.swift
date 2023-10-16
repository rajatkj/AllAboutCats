//
//  CatDetailView.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 16/10/23.
//

import SwiftUI

struct BreedDetailView: View {
    @Environment(\.dismiss) private var dismiss

    @State var breed: Breed?
    
    var body: some View {
        ScrollView {
            image
            detailsView
            Spacer()
            
            
        }
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    dismiss()
                } label: {
                    ZStack {
                        Circle().frame(width: 44)
                            .foregroundStyle(.black.opacity(0.25))
                        Image(systemName: "chevron.backward")
                    }
                    .foregroundStyle(.white)
                    
                }

            }
        }
        
    }
    
    private var image: some View {
        AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/\(breed?.referenceImageId ?? "").jpg")) { image in
            Color.clear
                .background(
                    image
                        .resizable()
                        .scaledToFill()
                )
            
        } placeholder: {
                Color.gray.opacity(0.15)
        }
        .aspectRatio(1, contentMode: .fill)
        .clipped()

    }
    
    private var detailsView: some View {
        VStack(alignment: .leading) {
            Text(breed?.origin ?? "")
                .font(.headline)
                .foregroundColor(.secondary)
            Text(breed?.name ?? "")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)

            Text(breed?.description ?? "")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}

#Preview {
    BreedDetailView(breed: .preview)
}
