//
//  VacanciesWebRepository.swift
//  EffectiveMobileTest
//
//  Created by Alex on 17.03.24.
//

import Foundation

struct VacanciesWebRepository {
    private let session = URLSession(configuration: .ephemeral)
    private let decoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
    func getAllVacancies() async throws -> [Vacancy] {
        try? await Task.sleep(for: .seconds(1))
        let url = WebAPI.endpoint
        let (receivedData, response) = try await session.data(from: url)
        let dataDecoded = try decoder.decode(WebAPI.VacanciesResponse.self, from: receivedData)
        return dataDecoded.vacancies
    }
}
