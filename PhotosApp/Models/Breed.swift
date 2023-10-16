//
//  Breed.swift
//  PhotosApp
//
//  Created by Rajat Jangra on 16/10/23.
//

import Foundation

struct Breed : Codable, Identifiable {
    let weight : Weight?
    let id : String?
    let name : String?
    let cfaUrl : String?
    let vetstreetUrl : String?
    let vcahospitalsUrl : String?
    let temperament : String?
    let origin : String?
    let countryCodes : String?
    let countryCode : String?
    let description : String?
    let lifeSpan : String?
    let indoor : Int?
    let lap : Int?
    let altNames : String?
    let adaptability : Int?
    let affectionLevel : Int?
    let childFriendly : Int?
    let dogFriendly : Int?
    let energyLevel : Int?
    let grooming : Int?
    let healthIssues : Int?
    let intelligence : Int?
    let shedding_level : Int?
    let socialNeeds : Int?
    let strangerFriendly : Int?
    let vocalisation : Int?
    let experimental : Int?
    let hairless : Int?
    let natural : Int?
    let rare : Int?
    let rex : Int?
    let suppressed_tail : Int?
    let shortLegs : Int?
    let wikipediaUrl : String?
    let hypoallergenic : Int?
    var referenceImageId : String?
}
