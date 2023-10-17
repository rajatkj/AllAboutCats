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
    
    private var placeholders: [String] = ["Siamese", "Meow?", "Ragdoll"]
    @Published var currentPlaceholder = ""
    
    @Published var searchText: String = "" {
        didSet{
            self.searchResults = breeds.filter({ $0.name?.lowercased().hasPrefix(searchText.lowercased()) ?? false })
        }
    }
    
    @Published var searchResults: [Breed] = []
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    static var preview = CatViewModel(service: RandomCatServiceImpl())
    
    init(service: RandomCatService) {
        self.catService = service
    }
    
    @MainActor
    func getAllBreeds() async {
        do {
            self.breeds = try await catService.getAllCatBreeds()
            self.placeholders = breeds.map({ $0.name ?? "" })
        } catch let error {
            print(error)
        }
    }
    
    func changePlaceholder() {
        currentPlaceholder = placeholders.randomElement() ?? ""
    }
}
