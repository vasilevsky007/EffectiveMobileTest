//
//  WorkAppSwiftUI.swift
//  EffectiveMobileTest
//
//  Created by Alex on 15.03.24.
//

import SwiftUI

@MainActor class WorkAppSwiftUI: ObservableObject {
    @Published var currentUser: User?
    @Published var vacancies: Loadable<[Vacancy]> = .notLoaded(error: nil)
    
    private var webRepository = VacanciesWebRepository()
    
    var isAuthenticated: Bool {
        guard let currentUser = currentUser else { return false }
        return currentUser.isAuthenticated
    }
    
    var favouritesNumber: Int {
        guard let vacancies = vacancies.value else { return 0 }
        var number = 0
        for vacancy in vacancies {
            if vacancy.isFavorite {
                number += 1
            }
        }
        return number
    }
    
    var favouriteVacancies: [Vacancy] {
        guard let vacancies = vacancies.value else { return [] }
        var favourite: [Vacancy] = []
        for vacancy in vacancies {
            if vacancy.isFavorite {
                favourite.append(vacancy)
            }
        }
        return favourite
    }
    
    func startUserAuthentication(with email: EmailAddress) {
        currentUser = User(email: email)
    }
    
    func endUserAuthentication(with code: String) {
        currentUser?.saveToken(code)
    }
    
    func loadVacancies () {
        vacancies = .loading(last: vacancies.value)
        Task.detached {
            do {
                let newVacancies = try await self.webRepository.getAllVacancies()
                Task {
                    await self.saveVacaniesLoaded(newVacancies)
                }
            } catch {
                Task {
                    await self.errorLoadingVacancies(error)
                }
            }
        }
    }
    
    func toggleFavourites(on vacancy: Vacancy) {
        if let vacancies = vacancies.value {
            guard let index = vacancies.firstIndex(where: { $0.id == vacancy.id }) else { return }
            var newVacancies = vacancies
            newVacancies[index].isFavorite.toggle()
            switch self.vacancies {
            case .notLoaded(_):
                return
            case .loading(_):
                withAnimation{
                    self.vacancies = .loading(last: newVacancies)
                }
            case .loaded(_):
                withAnimation{
                    self.vacancies = .loaded(newVacancies)
                }
            }
        }
    }
    
    private func saveVacaniesLoaded(_ vacancies: [Vacancy]) {
        withAnimation {
            self.vacancies = .loaded(vacancies)
        }
    }
    private func errorLoadingVacancies(_ error: Error) {
        withAnimation {
            self.vacancies = .notLoaded(error: error)
        }
    }
}
