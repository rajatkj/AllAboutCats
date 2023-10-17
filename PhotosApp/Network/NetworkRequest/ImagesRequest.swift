//
//  ImagesRequest.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 16/10/23.
//

import Foundation

struct ImagesRequest: NetworkRequest {
    typealias Response = PagedRequest<URL>
    
    var networkResourceName: String = "images/search"
    
}
