//
//  WebAPI.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import Foundation

/// A struct representing the web API specific info
struct WebAPI {
    /// The base endpoint URL for the API.
    static let endpoint = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14")!
    
    /// A nested struct representing the response structure for the vacancies endpoint.
    struct VacanciesResponse: Codable {
        let vacancies: [Vacancy]
    }
}
