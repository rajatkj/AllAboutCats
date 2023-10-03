//
//  NetworkRequest.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation

protocol NetworkRequest: Codable {
    
    associatedtype Response: Codable
    
    var networkResourceName: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: [String: String]? { get }
    var headers: [String: String] { get }
}

extension NetworkRequest {
    var httpMethod: HTTPMethod {
        .get
    }
    
    var parameters: [String: String]? {
        nil
    }
    
    var headers: [String: String] {
        [:]
    }
}

extension NetworkRequest {
    
}

struct DebugData: Error {
    var response: String?
    var request: String?
    var headers: [String: String]?
    var error: NetworkError?
}
