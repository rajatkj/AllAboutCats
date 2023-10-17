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
            VStack(alignment: .leading) {
                image
                detailsView
                ratingListView
            }
            
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
        VStack(alignment: .leading, spacing: 8.0) {
            HStack {
                Text(breed?.origin ?? "")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Spacer()
                linkView
            }
            
            Text(breed?.name ?? "")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)

            Text(breed?.description ?? "")
                .font(.caption)
                .foregroundColor(.primary)
            temperamentView
        }
        .padding(.horizontal)

    }
    
    @ViewBuilder
    private var ratingListView: some View {
        if let ratings = breed?.ratings {
            ForEach(ratings.sorted(by: >), id: \.key) { key, value in
                if value != 0 {
                    RatingView(title: key, value: value, total: 5)
                }
            }
        }
    }
    
    @ViewBuilder
    private var linkView: some View {
        if let wikipediaUrl = breed?.wikipediaUrl, let url = URL(string: wikipediaUrl) {
            Link(destination: url, label: {
                HStack(spacing: 0) {
                    Image(systemName: "link")
                        .font(.caption)
                    Text("Wikipedia")
                        .font(.callout)
                }
            })
        }
    }
    
    private var temperamentView: some View {
        HStack() {
            Text("Temperament ")
                .font(.caption)
                .fontWeight(.bold)
            +
            Text(breed?.temperament ?? "Active, Playful")
                .font(.caption2)

        }
    }
}

#Preview {
    BreedDetailView(breed: .preview)
}
