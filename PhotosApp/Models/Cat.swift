//
//  Cat.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 03/10/23.
//

import Foundation
struct Cat: Codable, Identifiable {
    
//    [{
//    "id":"ebv",
//    "url":"https://cdn2.thecatapi.com/images/ebv.jpg",
//    "width":176,"height":540,
//    "breeds":[],
//    "favourite":{}
//    }]
    
    var id: String
    var url: URL
    var width: Int
    var height: Int
}
