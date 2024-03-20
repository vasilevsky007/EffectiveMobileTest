//
//  Vacancy.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import Foundation

/// A structure representing a job vacancy.
struct Vacancy: Identifiable, Codable {
    // MARK: - Fields
    /// The unique identifier for the vacancy.
    let id: String
    /// The schedules associated with the vacancy.
    let schedules: [String]
    /// The description of the vacancy.
    let description: String?
    /// The number of people currently viewing the vacancy.
    let lookingNumber: Int?
    /// A Boolean value indicating whether the vacancy is marked as favorite.
    var isFavorite: Bool
    /// The number of people who have already applied for the vacancy.
    let appliedNumber: Int?
    /// The salary details associated with the vacancy.
    let salary: Salary
    /// The name of the company offering the vacancy.
    let company: String
    /// The date when the vacancy was published.
    let publishedDate: Date
    /// The title of the vacancy.
    let title: String
    /// The address details associated with the vacancy.
    let address: Address
    /// The responsibilities associated with the vacancy.
    let responsibilities: String
    /// The questions related to the vacancy.
    let questions: [String]
    /// The experience required for the vacancy.
    let experience: Experience
    
    // MARK: - Nested structs
    /// A structure representing the salary details of a vacancy.
    struct Salary: Codable {
        /// The full salary description.
        let full: String?
        
        /// The short salary description.
        let short: String?
    }
    
    /// A structure representing the address details of a vacancy.
    struct Address: Codable {
        /// The street address.
        let street: String
        
        /// The house number.
        let house: String
        
        /// The town or city.
        let town: String
        
        /// A formatted description of the address.
        var description: String {
            "\(town), \(street), \(house)"
        }
    }
    
    /// A structure representing the experience required for a vacancy.
    struct Experience: Codable {
        /// The full text describing the required experience.
        let text: String
        
        /// A preview text describing the required experience.
        let previewText: String
    }
}

