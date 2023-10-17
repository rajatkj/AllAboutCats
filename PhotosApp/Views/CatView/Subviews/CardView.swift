//
//  CardView.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 16/10/23.
//

import SwiftUI

extension CardView: Equatable {
    static func == (lhs: CardView, rhs: CardView) -> Bool {
        lhs.breed?.id == rhs.breed?.id
    }
}

struct CardView: View {
    let breed: Breed?

    var body: some View {
            ZStack {
                image
                    .overlay(alignment: .bottom) {
                        overlay
                    }
                descriptionView
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
            .padding([.top, .horizontal])
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

    }
    
    private var overlay: some View {
        LinearGradient(gradient: Gradient(colors: [.clear, .black]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
    
    private var descriptionView: some View {
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text(breed?.origin ?? "")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(breed?.name ?? "")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .lineLimit(3)
                Text(breed?.temperament ?? "")
                    .font(.caption)
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            .layoutPriority(100)
            .padding()
            Spacer()
        }
    }
}

#Preview {
    CardView(breed: .preview)
}
