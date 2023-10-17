//
//  CatMapView.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 17/10/23.
//

import SwiftUI
import MapKit

struct CatMapView: View {
    @ObservedObject var viewModel: CatMapViewModel
    @State private var position: MapCameraPosition = .automatic

    var body: some View {
        Map(initialPosition: position) {
            
            Annotation("", coordinate: viewModel.location.coordinate, anchor: .center) {
                if let breed = viewModel.breeds.first {
                    
                }
            }
        }
        .onAppear(perform: {
            viewModel.getCountryCoordinates(for: viewModel.breeds.first?.origin ?? "")
        })
            
    }
}

#Preview {
    CatMapView(viewModel: .preview)
}
