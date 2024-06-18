//
//  SuperHero.swift
//  SuperHero
//
//  Created by abd ul’Karim 📚 on 11.06.2024.
//

import Foundation

struct SuperHero: Decodable {
    let name: String
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let images: Image
    
    var description: String {
    """
    Name: \(name)
    Gender: \(appearance.gender)
    Race: \(appearance.race)
    Eye color: \(appearance.eyeColor)
    Hair: \(appearance.hairColor)
    Work: \(work)
    """
    }
}
struct Appearance: Decodable {
    let gender: String
    let race: String
    let eyeColor: String
    let hairColor: String
}

struct Biography: Decodable {
    let fullName: String
    let alterEgos: String
    let placeOfBirth: String
    let firstAppearance: String
    let publisher: String
    let alignment: String
    
    var description: String {
    """
    Full name: \(fullName)
    Alter ego: \(alterEgos)
    Place of birth: \(placeOfBirth)
    First appearance: \(firstAppearance)
    Publisher: \(publisher)
    Alignment: \(alignment)
    """
    }
}

struct Work: Decodable {
    let occupation: String
}

struct Image: Decodable {
    let sm: URL
    
}

enum SuperHeroesAPI {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.2.0/api/all.json")!
        }
    }
}
