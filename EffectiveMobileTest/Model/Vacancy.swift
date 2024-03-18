//
//  Vacancy.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import Foundation

struct Vacancy: Identifiable, Codable {
    let id: String
    let schedules: [String]
    let description: String?
    let lookingNumber: Int?
    var isFavorite: Bool
    let appliedNumber: Int?
    let salary: Salary
    let company: String
    let publishedDate: Date
    let title: String
    let address: Address
    let responsibilities: String
    let questions: [String]
    let experience: Experience
    
    struct Salary: Codable {
        let full: String?
        let short: String?
    }
    
    struct Address: Codable {
        let street: String
        let house: String
        let town: String
    
        var description: String {
            "\(town), \(street), \(house)"
        }
    }
    
    struct Experience: Codable {
        let text: String
        let previewText: String
    }
}
