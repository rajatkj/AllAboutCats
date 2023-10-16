//
//  BreedRequest.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 16/10/23.
//

import Foundation

struct BreedRequest: NetworkRequest {
    typealias Response = PagedRequest<Breed>
    
    var networkResourceName: String = "breeds"
}
