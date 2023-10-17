//
//  CatViewModel.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation

class CatViewModel: ObservableObject {
    private var catService: RandomCatService
    
    @Published var randomCat: [Cat] = []
    
    static var preview = CatViewModel(service: RandomCatServiceImpl())
    
    init(service: RandomCatService) {
        self.catService = service
    }
    
<<<<<<< Updated upstream
    func getRandomCat() async{
=======
    @MainActor
    func getAllBreeds() async {
>>>>>>> Stashed changes
        do {
            self.randomCat = try await catService.getRandomCats()
        } catch let error {
            print(error)
        }
    }
    
}
