//
//  CatMapViewModel.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 17/10/23.
//

import Foundation
import CoreLocation

class CatMapViewModel: ObservableObject {
    
    @Published var location: CLLocation = CLLocation()
    static let preview = CatMapViewModel(breeds: [.preview])
    let breeds: [Breed]
    
    init(breeds: [Breed]) {
        self.breeds = breeds
    }
    
    func getCountryCoordinates(for countryCode: String) {
        CLGeocoder().geocodeAddressString("US") { [weak self] placemark, error in
            guard let placemark = placemark, let location = placemark.first?.location else { return }
            self?.location = location
        }
    }
}
