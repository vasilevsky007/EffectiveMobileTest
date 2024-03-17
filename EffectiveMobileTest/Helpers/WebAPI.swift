//
//  WebAPI.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import Foundation

struct WebAPI {
    static let endpoint = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14")!
    
    struct VacanciesResponse: Codable {
        let vacancies: [Vacancy]
    }
}
