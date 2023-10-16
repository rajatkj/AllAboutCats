//
//  PagedRequest.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 09/10/23.
//

import Foundation

struct PagedRequest<T: Codable>: NetworkRequest {
    typealias Response = [T]
    
    var networkResourceName: String
    
}
