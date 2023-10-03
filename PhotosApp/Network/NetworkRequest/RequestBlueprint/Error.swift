//
//  Error.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation

struct NetworkError: Codable, Error {
    let message: String?
}
