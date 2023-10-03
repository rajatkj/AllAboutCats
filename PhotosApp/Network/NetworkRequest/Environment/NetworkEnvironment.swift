//
//  NetworkEnvironment.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation

protocol NetworkEnvironment {
    var baseURL: String { get }
}

struct DefaultNetworkEnvironment: NetworkEnvironment {
    enum InfoDictKey: String {
        case serverAddress = "ServerAddress"
    }
    
    var baseURL: String {
        Bundle.main.object(forInfoDictionaryKey: InfoDictKey.serverAddress.rawValue) as? String ?? ""
    }
}
