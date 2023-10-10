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
        let result = isPalindrome("race a car")
        print(result)
    }
    
    @MainActor
    func getRandomCat() async {
        do {
            self.randomCat = try await catService.getRandomCats()
        } catch let error {
            print(error)
        }
    }
    
}
