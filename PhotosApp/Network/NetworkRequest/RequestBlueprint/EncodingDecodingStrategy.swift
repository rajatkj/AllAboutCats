//
//  EncodingDecodingStrategy.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation

class JSONToCamelCaseDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
        dateDecodingStrategy = .iso8601
    }
}

class JSONSnakeCaseEncoder: JSONEncoder {
    override init() {
        super.init()
        keyEncodingStrategy = .convertToSnakeCase
        dateEncodingStrategy = .iso8601
    }
}
