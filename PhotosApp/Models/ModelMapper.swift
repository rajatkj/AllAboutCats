//
//  ModelMapper.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation

protocol ModelMapper {
    func mapModel<T>(_ model: T.Type, from data: Data?) throws -> T where T: Codable
}

struct DefaultModelMapper: ModelMapper {
    
    func mapModel<T>(_ model: T.Type, from data: Data?) throws -> T where T: Codable {
        guard let data = data else { throw NetworkError(message: "Data is empty") }
        return try JSONToCamelCaseDecoder().decode(model, from: data)
    }
}
