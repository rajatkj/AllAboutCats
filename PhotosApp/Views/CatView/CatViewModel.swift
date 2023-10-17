//
//  CatViewModel.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation

class CatViewModel: ObservableObject {
    private var catService: RandomCatService
    
    @Published var breeds: [Breed] = []
    
    @Published var selectedBreed: Breed?
    
    static var preview = CatViewModel(service: RandomCatServiceImpl())
    
    init(service: RandomCatService) {
        self.catService = service
    }
    
    @MainActor
    func getAllBreeds() async {
        do {
            self.breeds = try await catService.getAllCatBreeds()
        } catch let error {
            print(error)
        }
    }
    
}
