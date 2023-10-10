//
//  PageModel.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 09/10/23.
//

import Foundation

struct Page<T: Codable>: Codable {
    
    let pageNumber: Int
    let totalResults: Int
    let totalPages: Int
    let results: [T]
}
