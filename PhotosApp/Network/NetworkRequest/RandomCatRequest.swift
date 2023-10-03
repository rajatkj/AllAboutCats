//
//  FeedRequest.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation

struct RandomCatRequest: NetworkRequest {
    typealias Response = [Cat]
    
    var networkResourceName: String = "images/search"
    
}
