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
    var name : String?
    var cfaUrl : String?
    var vetstreetUrl : String?
    var vcahospitalsUrl : String?
    var temperament : String?
    var origin : String?
    var countryCodes : String?
    var countryCode : String?
    var description : String?
    var lifeSpan : String?
    var indoor : Int?
    var lap : Int?
    var altNames : String?
    var adaptability : Int?
    var affectionLevel : Int?
    var childFriendly : Int?
    var dogFriendly : Int?
    var energyLevel : Int?
    var grooming : Int?
    var healthIssues : Int?
    var intelligence : Int?
    var shedding_level : Int?
    var socialNeeds : Int?
    var strangerFriendly : Int?
    var vocalisation : Int?
    var experimental : Int?
    var hairless : Int?
    var natural : Int?
    var rare : Int?
    var rex : Int?
    var suppressed_tail : Int?
    var shortLegs : Int?
    var wikipediaUrl : String?
    var hypoallergenic : Int?
    var referenceImageId : String?
    
    var ratings: [String: Int] {
        
        let values = [affectionLevel, adaptability, childFriendly, dogFriendly, energyLevel, grooming, healthIssues, intelligence, shedding_level, socialNeeds, strangerFriendly, vocalisation].map({ $0 ?? 0 })
        let keys = ["Affection Level",
                    "Adaptability",
                    "Child Friendly",
                    "Dog Friendly",
                    "Energy Level",
                    "Grooming",
                    "Health Issues",
                    "Intelligence",
                    "Shedding Level",
                    "Social Needs",
                    "Stranger Friendly",
                    "Vocalisation"]
        return Dictionary(uniqueKeysWithValues: zip(keys, values))
    }
    
    static let preview: Breed = Breed(weight: Weight(metric: "", imperial: ""), id: "", name: "Britih Short hair", origin: "UK", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", referenceImageId: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")
}
