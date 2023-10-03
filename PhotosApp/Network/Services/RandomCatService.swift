//
//  RandomCatService.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation

protocol RandomCatService {
    func getRandomCats() async throws -> [Cat]
}

class RandomCatServiceImpl: RandomCatService {
    
    let networkManager: NetworkManager
    init(networkManager: NetworkManager = DefaultNetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getRandomCats() async throws -> [Cat] {
        let request = RandomCatRequest()
        let (randomCat, _) = try await networkManager.perform(request)
        return randomCat
    }
}
